[![Gem Version](https://badge.fury.io/rb/guard-yardstick.svg)](http://badge.fury.io/rb/guard-yardstick)

# guard-yardstick

guard-yardstick will automatically check your code for missing yardocs

## Installation

Add `guard-yardstick` to your `Gemfile`:

```ruby
group :development do
  gem 'guard-yardstick'
end
```

And then execute:

```sh
$ bundle
```

Or install it yourself as:

```sh
$ gem install guard-yardstick
```

## Usage

Please read the [Guard usage documentation](https://github.com/guard/guard#readme).

## Options

You can pass some options in `Guardfile` like the following example:

```ruby
guard :yardstick, all_on_start: false do
  # ...
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
