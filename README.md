# Stealth::Postback

Simple driver for [Stealth](https://github.com/hellostealth/stealth) that sends the message as POST request to the specified url.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'stealth-postback'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install stealth-postback

## Usage

Run the setup in order to gnerate a secret that will be used to sign the message posted:
```ruby
    bundle stealth setup postback
```

This **secret** needs to be used on the receiver end to validate the Authorization header on the request.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/barkibu/stealth-postback.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
