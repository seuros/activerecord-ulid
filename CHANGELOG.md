# Changelog

## 0.2.0

- Generate each record's ULID through a per-record attribute default. Rails main freezes a model's default attributes at
  schema load, which cast `nil` once and handed every new record the same ULID.
- Persist prefixed ULID columns when `partial_inserts` is enabled; they used to be skipped as unchanged and read back as
  a new random value.
- `initial: false` without `nullable: true` no longer raises on `nil`.
- An explicit `default:` on a `:ulid` attribute is kept as given.
