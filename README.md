# activerecord-ulid

A `:ulid` attribute type for Active Record. Every record gets its own
[ULID](https://github.com/ulid/spec) the moment it's built: sortable, unique,
and readable in a URL.

Requires Ruby 4.0+ and Active Record 8.1+.

## Installation

```ruby
gem "activerecord-ulid"
```

## Usage

ULIDs live in string columns:

```ruby
create_table :users, id: :string do |t|
  t.string :invite_code
end

class User < ApplicationRecord
  attribute :id, :ulid
end

User.new.id # => "01JBQ8Z3X4M6V2N9R7T5K1W0HD"
```

Prefix them, Stripe style:

```ruby
attribute :id, :ulid, prefix: "usr_" # => "usr_01JBQ8Z3X4M6V2N9R7T5K1W0HD"
```

Options:

- `prefix:` prepended to the ULID.
- `nullable: true` (or `initial: false`) leaves `nil` alone: no ULID is generated.
- `default:` given explicitly wins over the generated ULID.

Assigning `nil` to a generating attribute gives it a fresh ULID.

## Development

```console
$ bundle exec rake test                 # padded_cell, Rails 8.1
$ RAILS_VERSION=edge bundle exec rake   # Rails main
$ dictator lint .
```

## License

MIT. See [LICENSE.txt](LICENSE.txt).
