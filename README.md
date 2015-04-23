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

After correctly installing the gem initialize your Guardfile as follows.

```sh
$ bundle exec guard init yardstick
```

Please read the [Guard usage documentation](https://github.com/guard/guard#readme) for further details.

## Options

There is currently only a single option that can be passed to this guard. *all_on_start* which is *true* by default.

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
