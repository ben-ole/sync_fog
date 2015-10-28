# FogSync Gem
# https://github.com/ben-ole/fog_sync
# Benjamin Müller
# 2015

FogSync.configure do |config|

  ##
  # Basic Fog configuration
  # see (TODO: add fog readme)
  #
  config.fog_options = {
    provider:            'OpenStack',
    openstack_auth_url:  'https://identity-dd2a.cloudandheat.com:5000/v2.0/tokens/',
    openstack_username:  'aktion@yorck.de',
    openstack_api_key:   'Yorcker.2015'
  }

  ##
  # Bucket/Container to use for syncing. 
  # Note: This container should be only used for assets syncing. 
  # All other files will be removed automatically.
  config.fog_bucket = "yorck_assets_production"

  ##
  # Directory to be synced. This would typically point to public/assets  
  #
  config.source_dir = "."

end
