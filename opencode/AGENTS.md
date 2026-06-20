# Go Coding Style

## Data structures
- Sets: use `map[string]struct{}`, never `[]string` + manual dedup
- Maps: allocate with `make(map[K]V, hint)` when capacity is known
- Slices: prefer `var s []T` (nil) over `s := []T{}` (empty) to signal absence; use `append` for growth
- Zero-value structs: prefer `var t T` over `t := T{}` when zero value is usable

## Types
- Use `any` over `interface{}` everywhere
- Prefer concrete types over `any` when the type is known at compile time
- Define named types for meaningful domain values, not aliases for readability alone

## Error handling
- `errors.New("static message")` for constant messages; `fmt.Errorf("format %w", err)` for wrapped errors
- Always check errors: `if err != nil { return ... }`, never `_ = err` or silent discards
- Early return over deeply nested `if err == nil` chains
- Use `errors.Is()` and `errors.As()` over direct comparison when unwrapping
- Sentinel errors are package-level vars: `var ErrNotFound = errors.New("not found")`

## Naming
- Unexported: `camelCase`, Exported: `PascalCase`
- Acronyms: `HTTP`, `URL`, `ID`, `DB`, `API` (not `Http`, `Url`, `Id`)
- Single-letter receivers for short types (`t T`), descriptive for complex types
- Avoid stutter: `user.UserName` not `user.UserUserName`
- Package names: lowercase, single word, no underscores

## Code organization
- File layout: `package` → `import` → `const`/`var` → `type` → `init()` → exported funcs → unexported funcs
- Group related types and their methods in the same file
- Prefer composition over embedding; only embed when the relationship truly is "is-a"
- Keep interfaces small (1-3 methods); define them at the consumer site, not the producer
- Use `internal/` to enforce package boundaries

## Testing
- Table-driven tests with `t.Run(name, func(t *testing.T) { ... })`
- Test helpers: call `t.Helper()` as the first line
- Use `cmp.Diff` or `reflect.DeepEqual` for struct comparison, not manual field checks
- Test packages: `package foo_test` for black-box, `package foo` for white-box
- Name: `TestFuncName_caseDescription`

## Concurrency
- Use `errgroup` for bounded goroutine groups over raw `sync.WaitGroup`
- `context.Context` is always the first parameter in public functions that may block
- Channel ownership: sender closes, receiver never closes; document in the type contract
- Prefer `sync.Once` for lazy init over `sync.Mutex` + nil check

## JSON
- Use `json:",omitempty"` on optional/slice fields
- `json.RawMessage` for deferred or dynamic payload decoding
- Custom marshalers: implement `json.Marshaler`/`json.Unmarshaler` directly, avoid `map[string]any` intermediates
- Use `json.Encoder`/`json.Decoder` for streams; `json.Marshal`/`json.Unmarshal` for in-memory

## Imports
- Group: stdlib → third-party → internal (one blank line between groups)
- Avoid `import . "pkg"` except in tests for `testify`-style helpers
- Run `goimports` (or `gofumpt`) before committing

## Comments
- Exported identifiers always have doc comments: `// Package foo ...`, `// FuncName ...`
- Doc comments are complete sentences ending with period
- Inline comments explain *why*, not *what* (the code says what)
