[![Gem Version](https://badge.fury.io/rb/sync_fog.svg)](https://badge.fury.io/rb/sync_fog)
[![Code Climate](https://codeclimate.com/github/ben-ole/sync_fog/badges/gpa.svg)](https://codeclimate.com/github/ben-ole/sync_fog)

# SyncFog

SyncFog is a super simple way to upload precompiled (static) assets on a file storage like S3, Rackspace or OpenStack. This is specifically useful if you are deploying to cloud containers like Heroku as you don't want your application containers being responsible for serving static files.

Once installed, SyncFog updates all changed files on every deploy (rake assets:precomile).

This gem is an alternative to [asset_sync](https://github.com/AssetSync/asset_sync) as I've had trouble using that with OpenStack (Swift).

- SyncFog is multi-threaded, so it's kind of fast
- SyncFog can be used with any storage supported by the famous [fog gem](https://github.com/fog/fog).
- SyncFog is easy to configure (using almost the same attributes as carrierwave!)
- SyncFog hooks in automatically on assets:precompile
- tested with Rails 4.2 and OpenStack, but should work with Rails 3+

## Installation

1. Add this line to your application's Gemfile:

  ```ruby
  gem 'sync_fog'
  ```

1. And then execute:

    ```
    $ bundle
    ```
1. Run the generator to build a default config

    ```
    $ rails generate sync_fog:install
    ```
1. Checkout and edit the config at ```/config/initializers/sync_fog.rb```

1. Get the public path of your new asset host

    ```
    $ rake sync_fog:url
    ```
1. And use the URL as your asset_host in ```config/environments/production.rb```

    ```
    config.action_controller.asset_host = 'xyz'
    ```

## Usage

- Get public URL of the asset container/bucket:

    ```
    $ rake sync_fog:url
    ```
- Manually trigger synchronization of assets. This task expects you've precompiled your assets before with ```rake assets:precompile```.

    ```
    $ rake sync_fog:sync
    ```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ben-ole/sync_fog.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

