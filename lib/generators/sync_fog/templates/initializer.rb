# SyncFog Gem
# https://github.com/ben-ole/sync_fog
# Benjamin Müller
# 2015

SyncFog.configure do |config|

  ##
  # Basic Fog configuration
  # see [Fog Docs](http://fog.io/about/provider_documentation.html)
  # Required to set!
  #
  config.fog_credentials = {
    provider:            'OpenStack',
    openstack_auth_url:  '<auth url>',
    openstack_username:  '<username>',
    openstack_api_key:   '<pw>'
  }

  ##
  # Bucket/Container to use for syncing.
  # Note: This container should be only used for assets syncing.
  # All other files will be removed automatically!
  # Required to set!
  #
  config.fog_directory = "<bucket/container>"

  ##
  # Directory to be synced. This would typically point to public/assets
  # Required to set!
  #
  config.source_dir = "."


  # ##
  # # Metadata attributes to put for each file
  # # Default is { }
  # #
  # config.fog_attributes = { 'Cache-Control' => "public, max-age=#{365.days.to_i}" }

  # ##
  # # Set this to true if the file names of your assets change
  # # whenever their content updates (asset digests).
  # # Default is true
  # #
  # config.skip_existing = true

  # ##
  # # Number of Threads to use simultaniously
  # # Default is 5
  # #
  # config.num_threads = 5

  # ##
  # # Enable/Disable automatic sync whenever rake assets:precompile runs.
  # # Default is true
  # #
  # config.hook_enabled = true
  
  # ##
  # # Enable/Disable upload only gzip variants and set correct headers.
  # # Default is true
  # #
  # config.use_gzip = true
  
end
