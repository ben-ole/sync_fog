# SyncFog Gem
# https://github.com/ben-ole/sync_fog
# Benjamin Müller
# 2015

SyncFog.configure do |config|

  ##
  # Basic Fog configuration
  # see (TODO: add fog readme)
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
  # All other files will be removed automatically.
  config.fog_directory = "<bucket/container>"

  ## 
  # Metadata attributes to put for each file
  #
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }

  ##
  # Set this to true if the file names of your assets change 
  # whenever their content updates (asset digests). 
  #
  config.skip_existing = true

  ##
  # Directory to be synced. This would typically point to public/assets  
  #
  config.source_dir = "."

  ##
  # Number of Threads to use simultaniously
  #
  config.num_threads = 5
    
end
