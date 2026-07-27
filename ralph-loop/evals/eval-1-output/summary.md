# Ralph Loop Setup — React + TypeScript Todo App

## Generated Files

| File | Purpose |
|------|---------|
| `prd.json` | 6 user stories covering the full feature set, ordered by priority and dependency |
| `ralph.bat` | Windows batch loop script for Claude Code (default 10 iterations) |
| `prompt.md` | Per-iteration autonomous agent prompt with quality gates baked in |
| `progress.txt` | Initialized progress log with Codebase Patterns and Iteration Log sections |

## Story Breakdown (6 stories)

1. **US-001** — Bootstrap React + TS project with Vite, ESLint, and Vitest
2. **US-002** — Define Todo model and implement Add functionality
3. **US-003** — Display list with toggle completion and delete
4. **US-004** — Edit todo title inline (double-click)
5. **US-005** — Persist todos to localStorage
6. **US-006** — Filter todos by status (All / Active / Completed)

## Quality Gates

```
npx tsc --noEmit && npm test && npx eslint .
```

## How to Run

```
ralph.bat claude
ralph.bat claude 20
```

## Design Decisions

- Vite chosen over CRA for speed and modern defaults
- Vitest + React Testing Library for testing (ecosystem match with Vite)
- No backend — all persistence via localStorage
- Stories are vertical slices: each is independently testable and shippable
- US-001 bootstraps the entire test/lint pipeline so all subsequent stories can rely on quality gates passing
