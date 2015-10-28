module SyncFog

  class Configuration

    ##
    # Basic Fog configuration
    # see (TODO: add fog readme)
    #
    attr_accessor :fog_options

    ##
    # Bucket/Container to use for syncing. 
    # Note: This container should be only used for assets syncing. 
    # All other files will be removed automatically.
    attr_accessor :fog_bucket

    ##
    # Directory to be synced. This would typically point to public/assets  
    #
    attr_accessor :source_dir

    def initialize #:nodoc:
      @fog_options = { }

      @fog_bucket = ""

      @source_dir = ""
    end
  end

end