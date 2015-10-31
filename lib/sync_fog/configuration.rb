# SyncFog Gem
# https://github.com/ben-ole/sync_fog
# Benjamin Müller
# 2015

module SyncFog

  class Configuration

    ##
    # Basic Fog configuration
    # see [Fog Docs](http://fog.io/about/provider_documentation.html)
    # Required to set!
    #
    attr_accessor :fog_credentials

    ##
    # Bucket/Container to use for syncing.
    # Note: This container should be only used for assets syncing.
    # All other files will be removed automatically!
    # Required to set!
    #
    attr_accessor :fog_directory

    ##
    # Metadata attributes to put for each file
    # Default is { }
    #
    attr_accessor :fog_attributes

    ##
    # Directory to be synced. This would typically point to public/assets
    # Required to set!
    #
    attr_accessor :source_dir

    ##
    # Set this to true if the file names of your assets change
    # whenever their content updates (asset digests).
    # Default is true
    #
    attr_accessor :skip_existing

    ##
    # Number of Threads to use simultaniously
    # Default is 5
    #
    attr_accessor :num_threads


    ##
    # Enable/Disable automatic sync whenever rake assets:precompile runs.
    # Default is true
    #
    attr_accessor :hook_enabled


    def initialize #:nodoc:
      @fog_credentials = { }

      @fog_directory = ""

      @fog_attributes = { }

      @skip_existing = true

      @source_dir = ""

      @num_threads = 5

      @hook_enabled = true
    end
  end

end