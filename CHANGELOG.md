# Changelog

## 0.2.0

- Requires Ruby 4.0+ and Active Record 8.1+.
- `ULIDAttribute` is now `ActiveRecordULID::Type`; the gem no longer defines a top-level constant.
- Generate each record's ULID through a per-record attribute default. Rails main freezes a model's default attributes at
  schema load, which cast `nil` once and handed every new record the same ULID.
- Persist prefixed ULID columns when `partial_inserts` is enabled; they used to be skipped as unchanged and read back as
  a new random value.
- `initial: false` without `nullable: true` no longer raises on `nil`.
- An explicit `default:` on a `:ulid` attribute is kept as given.
