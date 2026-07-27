---
name: storm-research-workflow
description: Runs a structured, multi-perspective research workflow (inspired by Stanford's STORM system) for researching academic or technical projects — literature reviews, prior-art checks, thesis/capstone topic scoping, or finding a novel angle in a field. Always output clean markdown (outline + fully-cited draft), never LaTeX directly, since output feeds into a separate LaTeX skill. Use this whenever the user asks to research a topic for a project, wants help finding a gap or novel angle, is scoping a final-year/master's/PhD project, needs a related-work or literature-review section, or explicitly says "run the research workflow" / "use STORM" / similar. Especially trigger when the user has a tool or method in mind but no defined angle yet, or says things like "I don't know how to approach this."
---

# STORM-inspired research workflow

Most research goes wrong at the very first step: someone asks one question, reads the first few answers, and calls it done. Stanford's STORM system's real insight is that good research comes from asking the same topic several different, sharp questions from several different angles, then following up on what each answer reveals, rather than stopping at the first pass. This skill borrows that discipline and adapts it for graduate-level work, where the goal usually isn't just to summarize a topic — it's to find and defend a genuine gap.

Two checkpoints are built into this workflow on purpose. Don't skip them or fold them into a single final review — research invested against the wrong angle, or written up without a sanity check, is research that has to be redone.

## Step 0: Gather the essentials

Before starting, make sure you have:
- The topic or tool + domain (e.g. "A* algorithm" + "weather-aware routing")
- What the output is for (a related-work section, a design justification, a viva/defense point, a general literature review)
- Anything the user already has a direction on

If the topic is genuinely open-ended and neither is clear, ask one direct question — don't guess and burn a full research pass on the wrong framing. If enough is already in the conversation, proceed without asking.

## Step 1: Gap scan & framing

Scan the landscape the topic actually sits in — not just the literal phrase given, but adjacent domains that may already be doing something similar. For "weather mapping with A*", that means also checking ship weather routing, drone routing, and general pathfinding under dynamic cost fields, not just papers with "A*" and "weather" in the title together. For each adjacent area, note the technique that dominates it.

Prioritize primary academic sources here (Google Scholar, arXiv, IEEE Xplore, relevant standards bodies) over general web results — general web is fine for orientation, but a gap claim needs to rest on real literature, not blog summaries.

From the scan, surface 2-4 candidate angles: specific, narrow, defensible novel directions — not a restatement of the whole field.

## Checkpoint 1 — required, don't skip

Stop here. Present the candidate angles and ask the user which to run with (or whether none of them land and the scan needs to go wider). Never pick the angle for them and continue on your own — this is the single highest-leverage moment in the whole workflow, because everything downstream is wasted effort if the angle isn't one the user (or their advisor) would actually accept.

## Step 2: Perspectives & questions

Once the angle is confirmed, generate 4-6 distinct perspectives to interrogate it from — domain-specific lenses, not generic ones. For an engineering project these might be: regulatory/standards, technical/implementation, prior-art/competitive, practical/operational, economic. Under each perspective, write 3-5 concrete questions. Specific questions produce useful research; "what does X say about Y" beats "tell me about Y".

## Step 3: Iterative retrieval loop

For each question: search (academic sources first), summarize what you find, and check whether the answer raised a new question or exposed a gap. If it did, ask the follow-up and repeat. Keep going per perspective until you hit **citation saturation** — the same handful of core sources keep reappearing rather than new ones turning up. That's the signal you've found the actual landmark work in that corner of the topic, not a reason to stop searching early.

Track every source with full metadata as you go — author, year, venue/publisher, DOI or URL — not just a bare link. Recovering this after the fact is much harder than capturing it in the moment, and it's what turns the reference list into something that converts cleanly to BibTeX later.

## Step 4: Outline synthesis

Cluster everything gathered by theme, not by which perspective produced it. Shape the outline like an actual related-work / literature-review section: grouped by approach, moving from established methods toward the identified gap, ending in an explicit gap statement — the sentence that names what nobody's done yet and why it matters.

## Step 5: Draft

Write the draft in markdown from the outline. Every substantive claim carries its source. Paraphrase in your own words — citations are for attribution, not license to reproduce source text.

## Checkpoint 2 — required, don't skip

Before calling it finished, share the draft and outline back to the user for a sanity check — the equivalent of an advisor read before a real submission. Ask specifically whether the gap statement is defensible and whether any perspective feels thin.

## Output format

Always output clean markdown: headers per section, a References section at the end with full metadata per source in a consistent format (not just bare links), ready to convert to BibTeX. Never produce LaTeX directly — the handoff to LaTeX happens through a separate skill, and this one's job ends at markdown.

## Example (abbreviated)

**Input:** "I want to do a novel weather-mapping project using the A* algorithm for my project, but I don't know how to go about it."

**Stage 1 output (abbreviated):**
> Adjacent areas checked: ship weather routing (dominant technique: isochrone method, dynamic programming), drone path planning under wind fields (potential fields, RRT*), robotics motion planning with dynamic costs (D* Lite, weighted A*).
>
> Candidate angles:
> 1. A real-time A* variant that re-plans as live weather data streams in, rather than a static pre-voyage plan
> 2. A novel heuristic for A* that encodes weather-driven fuel/time cost more tightly than existing admissible heuristics
> 3. Applying A* to a domain that currently uses isochrone/DP methods, to compare tradeoffs directly

> Which of these feels closest to worth pursuing — or does none of them land yet?

That checkpoint reply is what Step 2 onward builds on — the workflow never guesses past it.

## Why this matters here

The discipline in Checkpoint 1 and the gap-statement requirement in Step 4 exist because graduate-level novelty claims get scrutinized hard — the same way a final-year project's "first tool to do X" claim gets tested at a viva. A gap that sounds plausible in a first pass often turns out to already be covered once you check the adjacent domains properly; better to find that out at Checkpoint 1 than after a full draft is written.
