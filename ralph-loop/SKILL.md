---
name: ralph-loop
description: "Scaffold and configure an autonomous AI coding loop (the Ralph pattern) for a project. Generates a PRD, loop script, per-iteration prompt, and progress log — everything needed to let Claude Code or Google Antigravity grind through a set of user stories unattended, overnight or over a weekend. Use when the user wants to set up a ralph loop, automate a feature backlog, run autonomous/unattended coding iterations, or mentions 'ralph' in the context of AI task loops — even if they just describe wanting to 'let the agent work through my backlog while I sleep' without naming the pattern."
---

# Ralph Loop

Set up an autonomous iteration loop that repeatedly spawns a fresh AI agent to implement user stories from a PRD, one at a time, until the backlog is done. Each iteration gets a clean context window; memory persists through git history, a progress log, and the PRD status file.

The skill handles the full lifecycle: interview the user about what they're building, generate the PRD, detect the project type, recommend quality gates, and produce the loop script plus all supporting files.

## Why this pattern works

A single long session eventually loses coherence — context fills, the model drifts, mistakes compound. The Ralph loop sidesteps this by treating each iteration as disposable: the agent starts fresh, reads the state of the world from disk (git log, progress.txt, prd.json, any AGENTS.md/CLAUDE.md files), picks the next task, does the work, commits, and exits. The next iteration inherits only what's on disk — not a decaying conversation.

Small tasks, tight feedback loops, and append-only memory make the system self-correcting: a bad commit shows up as a test failure in the next iteration, which can then fix it. This is also why the quality gates in step 3 aren't optional busywork — they're the mechanism that keeps a bad commit from silently becoming tomorrow's foundation. Skip them and the loop doesn't fail loudly; it just quietly compounds mistakes.

## Supported tools

The loop script supports two AI CLI tools. The user picks one during setup:

| Tool | Invocation |
|------|-----------|
| Claude Code | `claude --dangerously-skip-permissions -p "<instruction>"` |
| Google Antigravity | `agy -p "<instruction>"` |

**Why `-p` with an explicit instruction, not `< prompt.md` via stdin?** Piping a file into `claude --print` via stdin makes Claude treat the content as a document to *describe*, not instructions to *execute*. It will summarize the prompt and ask "what would you like to do?" — burning every iteration with zero work. Instead, the loop script passes a short `-p` prompt that tells the agent to read `prompt.md` from the filesystem and follow it. This way the agent enters its normal working mode and treats `prompt.md` as instructions.

## Process

### 1. Interview

Grill the user one question at a time to understand:

- **What they're building** — the product, feature set, or change they want automated
- **Which AI tool** — Claude Code or Antigravity (`agy`)
- **Repo state** — is there an existing codebase, or starting from scratch?
- **Preferred language / framework** — so quality gates can be chosen correctly

If a fact can be found by exploring the filesystem (package.json, Cargo.toml, pyproject.toml, go.mod, etc.), look it up rather than asking. Decisions are the user's — put each one to them and wait.

Where it helps, offer numbered options they can answer tersely (e.g. "1) Claude Code  2) Antigravity") rather than fully open-ended questions — this is a setup interview a user wants to get through quickly, not a design discussion. If a tappable-choice tool is available in your environment, this is a good place to use it.

**Flag anything that isn't actually autonomous work.** Not every task in a backlog is safe to hand to an unattended loop. Before locking in the story list, look for stories that hinge on a decision only the user can make — a genuine architecture choice, anything touching payments or destructive data operations, a call needing credentials the loop won't have. Don't quietly bake a guess into the PRD for these; either exclude them from the loop and tell the user they need to be handled by hand first, or write the acceptance criteria to fail safely and stop rather than improvise (e.g. "if the required API key isn't present in the environment, mark this story blocked and do not proceed"). The loop being unattended is exactly why this check matters — there's no one watching to catch a bad guess in the moment.

### 2. Generate the PRD

Break the user's requirements into **user stories** — vertical slices small enough to fit in a single agent context window (roughly 10–15 minutes of focused agent work). Each story should be independently implementable, testable, and cut through every layer it touches (UI, API, data) rather than being one layer of a larger feature — a story like "add the database column" and a separate one for "wire it into the UI" often can't be verified independently of each other, so prefer slicing so each story is shippable on its own.

Right-sized:
- "Add a `priority` column and migration"
- "Add a filter dropdown to the task list"

Too big — split these:
- "Build the entire dashboard"
- "Add authentication"

Each acceptance criterion must be something the agent can mechanically check, not something that needs judgment — "Filter dropdown has options: All, High, Medium, Low" rather than "filtering works well." For any story touching UI, add a criterion like "Verify in browser using \[browser tool\]" so the agent doesn't consider it done on typecheck alone.

Also capture **non-goals** — what this deliberately will *not* include. This is what keeps an unattended agent from quietly expanding scope on a vague story it doesn't fully understand.

Write `prd.json`:

```json
{
  "project": "...",
  "branchName": "ralph/short-feature-slug",
  "description": "One line: what this batch of work delivers",
  "non_goals": [
    "What's explicitly out of scope for this batch"
  ],
  "userStories": [
    {
      "id": "US-001",
      "title": "Short title",
      "description": "What this story delivers, from the user's perspective",
      "priority": 1,
      "passes": false,
      "notes": "",
      "acceptance_criteria": [
        "Criterion 1 — mechanically checkable",
        "Criterion 2"
      ]
    }
  ]
}
```

`notes` is a free field the agent can use to leave story-specific context without cluttering `progress.txt`. `branchName` lets the loop script and the agent agree on which branch this run belongs to.

Present the breakdown to the user for approval before writing the file — including any stories you flagged as not-safe-for-autonomous-execution and why. Stories are ordered by priority (1 = highest) and by dependency — a story never depends on a lower-priority one.

### 3. Detect project type and recommend quality gates

Inspect the repository for signals:

| Signal | Project type |
|--------|-------------|
| `package.json` | Node/JS/TS |
| `tsconfig.json` | TypeScript |
| `Cargo.toml` | Rust |
| `go.mod` | Go |
| `pyproject.toml` / `requirements.txt` | Python |
| `.csproj` / `.sln` | .NET/C# |
| `build.gradle` / `pom.xml` | Java/Kotlin |

Based on the detected type, recommend a quality gate sequence. Present it to the user for confirmation — they may want to add, remove, or reorder checks.

**Example recommendations:**

- **TypeScript (Node):** `npx tsc --noEmit && npm test && npx eslint .`
- **Rust:** `cargo check && cargo test && cargo clippy`
- **Python:** `python -m pytest && python -m mypy . && ruff check .`
- **Go:** `go build ./... && go test ./... && go vet ./...`
- **.NET:** `dotnet build && dotnet test`
- **Mixed / unknown:** Ask the user what commands verify correctness

If no test framework is set up yet and the project is new, suggest the user's ecosystem default and note that the first story should include bootstrapping the test harness.

### 4. Generate the loop script

Detect the user's OS. On Windows, use `assets/ralph.bat.template`. On macOS/Linux, use `assets/ralph.sh.template`. Copy the relevant template to the project root (as `ralph.bat` or `ralph.sh`), then replace `{QUALITY_GATES}` in `prompt.md` (step 5) with the actual commands from step 3 — the loop scripts themselves don't need edits beyond the copy.

Using bundled templates instead of retyping the script from scratch keeps two things intact that are easy to lose when reproducing a shell script freehand:

- **The invocation uses `-p` with an instruction to read `prompt.md`, not stdin redirect.** This is critical — `< prompt.md` makes the AI treat the file as a document to summarize rather than instructions to execute. The `-p` flag puts the AI in execution mode.
- **One bad iteration doesn't kill the whole run.** On Linux/macOS, the AI tool call uses `|| true` so a crash or transient error means that iteration didn't finish, not that the whole overnight run dies on iteration 2 of 20. On Windows, `cmd.exe` doesn't abort on non-zero exit by default, achieving the same effect.
- **No PowerShell pipe tricks.** Earlier versions tried piping through `Tee-Object` for live output, but `cmd.exe` mangles the braces and `$` in the PowerShell command string. The templates now write output to a temp file directly and use `findstr` to check for completion — simpler and works reliably on all Windows versions.

Tell them how to run it:

**Windows:**
```
ralph.bat claude
ralph.bat agy
ralph.bat claude 20
```

**macOS/Linux:**
```bash
chmod +x ralph.sh
./ralph.sh claude
./ralph.sh agy
./ralph.sh claude 20
```

### 5. Generate the iteration prompt

Copy `assets/prompt.md.template` to `prompt.md` and replace `{QUALITY_GATES}` with the actual commands from step 3. This is the prompt fed to the AI on every iteration — it must be self-contained, since the agent has no memory of prior runs.

The template already encodes: reading `prd.json`/`progress.txt`/`AGENTS.md`/git history before acting; working one story at a time; running quality gates; browser-verifying UI changes when a browser tool is available; committing; and updating status. Two things worth understanding about why it's built this way, since you may need to explain or adapt them:

- **Pattern consolidation, not just append-only logging.** `progress.txt` has a "Codebase Patterns" section at the top for durable, reusable learnings, separate from the dated log below it. Without this, a long-running loop's log grows unbounded and the useful patterns get buried under story-specific notes — every fresh iteration has to wade through the whole history to find what still matters. Likewise, if the agent discovers something a future iteration would need in a specific part of the codebase, it should land in an `AGENTS.md`/`CLAUDE.md` there (matching whichever file the project already uses) rather than only in the global log, since AI coding tools read those automatically.
- **The completion signal is deliberately unusual.** The agent outputs the exact string `<promise>COMPLETE</promise>` rather than a plain "COMPLETE" — a bare word is more likely to appear incidentally in verbose agent output and trigger a false-positive early exit from the loop.

### 6. Initialize progress.txt

Create `progress.txt` with a header that separates consolidated patterns from the iteration log:

```
# Progress Log

## Codebase Patterns
(General, reusable learnings go here — populated as iterations discover them.)

## Iteration Log
(Append-only. Each entry: date/time, story worked on, outcome, learnings.)

```

### 7. Present the setup to the user

Summarize what was generated:
- `prd.json` — N stories, ordered by priority, plus any flagged as unsuitable for autonomous execution
- `ralph.bat` or `ralph.sh` — the loop script
- `prompt.md` — the per-iteration prompt
- `progress.txt` — initialized, ready for entries

## Edge cases

- **No git repo:** Initialize one (`git init`) before generating files, or warn the user that git is required.
- **Existing PRD:** If `prd.json` already exists, ask whether to extend it or replace it.
- **Existing progress.txt:** Never overwrite — always append.
- **User wants to add stories later:** They can edit `prd.json` directly, adding new stories with `"passes": false` and the next priority number.
- **A story gets marked `"blocked"`:** Future iterations skip it rather than retrying it automatically — the loop will keep working through everything else and simply run out of iterations without ever emitting the completion signal. That's the intended behavior: it's the signal that a human needs to step in, not a bug in the loop.