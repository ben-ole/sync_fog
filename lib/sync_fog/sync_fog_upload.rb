# SyncFog Gem
# https://github.com/ben-ole/sync_fog
# Benjamin Müller
# 2015

require 'fog'
require 'parallel'

module SyncFog
  class SyncFogUpload

    def initialize(container,config)
      
      @fog_service  = Fog::Storage.new(config)
      @container    = @fog_service.directories.get(container)
      @skip         = SyncFog.configuration.skip_existing      
      @num_threads  = SyncFog.configuration.num_threads
      @meta         = SyncFog.configuration.fog_attributes
    end

    ## uploading files
    def upload(files,dir)

      Parallel.map(files,in_threads: @num_threads) do |source_file|
        upload_file(source_file,dir)
      end      
    end

    def upload_file(source_file,dir)
      path = dir + source_file
      name = source_file.to_s      

      return if File.directory?(path)
      return if @skip && @container.files.head(name)

      File.open(path) do |data|
        @container.files.create(key: name, body: data, metadata: @meta)
        @meta 
      end
    end

    ## Removing files
    def clean_remote(keep_files)
      keep_files_string = keep_files.map{|f| f.to_s}      

      Parallel.map(@container.files,in_threads: @num_threads) do |file|
        remove_file(file,keep_files_string)
      end
    end

    def remove_file(file,keep_files_string)
      unless keep_files_string.include?(file.key)        
        p "SyncFog: > removing #{file.key}"
        file.destroy 
      end
    end

    ## infos
    def public_url
      @container.public_url
    end

  end
end