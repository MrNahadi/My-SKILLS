# Quality Gates Reference

Quality gates are the commands the agent runs after implementing each story to verify nothing is broken. They're the ralph loop's immune system — without them, a bad commit silently becomes the foundation for subsequent iterations.

## Choosing gates

Pick gates that are:
- **Fast** — under 60 seconds ideally. A slow gate means fewer iterations per hour.
- **Deterministic** — no flaky tests, no network-dependent checks. A false failure wastes an entire iteration.
- **Comprehensive enough** — catching type errors, test failures, and obvious style violations covers 90% of what goes wrong.

## Per-ecosystem recommendations

### TypeScript (Node)

```bash
npx tsc --noEmit && npm test && npx eslint .
```

Variants:
- Vitest instead of Jest: `npx vitest run` (not `vitest` — that starts watch mode)
- Monorepo: `npx turbo run typecheck test lint`
- No linter yet: skip `eslint`, or add `biome check .`

### Rust

```bash
cargo check && cargo test && cargo clippy -- -D warnings
```

`-D warnings` turns clippy warnings into errors so the agent actually fixes them.

### Python

```bash
python -m pytest && python -m mypy . && ruff check .
```

Variants:
- No type hints yet: drop `mypy`
- Django: `python manage.py test`
- Poetry: prefix with `poetry run`

### Go

```bash
go build ./... && go test ./... && go vet ./...
```

Optional: add `staticcheck ./...` if installed.

### .NET / C#

```bash
dotnet build --no-restore && dotnet test --no-build
```

`--no-restore` and `--no-build` avoid redundant work.

### Java (Gradle)

```bash
./gradlew build
```

Gradle's `build` task already runs compile + test. Add `./gradlew spotlessCheck` for formatting.

### Java (Maven)

```bash
mvn verify -q
```

`-q` suppresses the wall of download logs.

### Kotlin (Gradle)

```bash
./gradlew build detekt
```

### Swift

```bash
swift build && swift test
```

### Elixir

```bash
mix compile --warnings-as-errors && mix test && mix credo
```

## When there's no test framework yet

If the project is brand new and has no tests, the first story in the PRD should set up the test harness. The quality gate for that first story can be just the build/typecheck:

```bash
npx tsc --noEmit
```

Then subsequent stories use the full gate chain.

## Custom gates

Users may want project-specific checks:
- `npm run validate` — a custom script that does everything
- Database migrations: `npx prisma migrate dev --name check`
- API contract: `npx openapi-diff spec.yaml generated.yaml`

Ask during setup if they have any custom verification commands.
