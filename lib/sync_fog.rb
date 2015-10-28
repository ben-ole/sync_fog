require "sync_fog/version"
require "sync_fog/configuration"
require "sync_fog/sync_fog_upload"
require "sync_fog/sync_fog_assets"

module SyncFog

  def self.configuration
    @configuration ||=  Configuration.new
  end

  def self.configure
    yield(configuration) if block_given?
  end
  
  def self.sync

    container_name = SyncFog.configuration.fog_bucket
    source_dir = SyncFog.configuration.source_dir

    # check if target container exists
    fog_uploader = SyncFogUpload.new( container_name )

    # list files to upload
    files = SyncFogAssets.new.list( source_dir )

    p "will upload the following files: #{files}"

    # upload files
    fog_uploader.upload( container_name, files )

    # delete old files
    fog_uploader.clean_remote( container_name, files )
  end

end
