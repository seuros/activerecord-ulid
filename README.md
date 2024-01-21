# Activerecord::Ulid


## Installation

Add this gem to your Gemfile:

```ruby
gem 'activerecord-ulid'
```

Then, run `bundle install`.

## Usage

in your model:

```ruby
class User < ActiveRecord::Base
  attribute :id, :ulid
end
```

you can add a prefix to the ulid:

```ruby

class User < ActiveRecord::Base
  attribute :id, :ulid, prefix: 'usr_'
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/seuros/activerecord-ulid.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
