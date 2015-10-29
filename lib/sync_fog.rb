# SyncFog Gem
# https://github.com/ben-ole/sync_fog
# Benjamin Müller
# 2015

require "sync_fog/version"
require "sync_fog/configuration"
require "sync_fog/sync_fog_upload"
require "sync_fog/sync_fog_assets"
require "sync_fog/tasks"


module SyncFog

  def self.configuration
    @configuration ||=  Configuration.new
  end

  def self.configure
    yield(configuration) if block_given?
  end
  
  def self.sync

    p "SyncFog: -- started syncing"

    container_name = SyncFog.configuration.fog_directory
    source_dir = SyncFog.configuration.source_dir

    p "SyncFog: -- source directory is: #{source_dir}"

    # check if target container exists
    fog_uploader = SyncFogUpload.new( container_name, SyncFog.configuration.fog_credentials )

    # list files to upload
    files = SyncFogAssets.new.list( source_dir )

    p "SyncFog: -- #{files.count} files found"

    # upload files
    p "SyncFog: -- uploading"
    root_path = Pathname.new File.expand_path('..',source_dir) # one dir up
    fog_uploader.upload( files, root_path )

    # delete old files
    p "SyncFog: -- cleaning up old files"
    fog_uploader.clean_remote( files )

    # info
    p "SyncFog: -- public url: #{fog_uploader.public_url}"

    p "SyncFog: -- done"
  end

  def self.public_url
    container_name = SyncFog.configuration.fog_directory

    fog_uploader = SyncFogUpload.new( container_name, SyncFog.configuration.fog_credentials )

    p "SyncFog: -- public url: #{fog_uploader.public_url}"    
  end

end
