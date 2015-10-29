# SyncFog Gem
# https://github.com/ben-ole/sync_fog
# Benjamin Müller
# 2015

module SyncFog

  class Configuration

    ##
    # Basic Fog configuration
    # see (TODO: add fog readme)
    #
    attr_accessor :fog_credentials

    ##
    # Bucket/Container to use for syncing. 
    # Note: This container should be only used for assets syncing. 
    # All other files will be removed automatically.
    #
    attr_accessor :fog_directory

    ## 
    # Metadata attributes to put for each file
    #
    attr_accessor :fog_attributes

    ##
    # Directory to be synced. This would typically point to public/assets  
    #
    attr_accessor :source_dir

    ##
    # Set this to true if the file names of your assets change 
    # whenever their content updates (asset digests). 
    #
    attr_accessor :skip_existing

    ##
    # Number of Threads to use simultaniously
    #
    attr_accessor :num_threads


    def initialize #:nodoc:
      @fog_credentials = { }

      @fog_directory = ""

      @fog_attributes = { }

      @skip_existing = true

      @source_dir = ""

      num_threads = 5
    end
  end

end