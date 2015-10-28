require 'fog'

module SyncFog
  class SyncFogUpload

    def initialize(container)
      @fog_service = Fog::Storage.new({
        provider:            'OpenStack',
        openstack_auth_url:  'https://identity-dd2a.cloudandheat.com:5000/v2.0/tokens/',
        openstack_username:  'aktion@yorck.de',
        openstack_api_key:   'Yorcker.2015'
      })

      @container = @fog_service.directories.get(container)
    end

    def upload(container,files)

      files.each do |source_file|
        source_name = File.basename( source_file )
        @container.files.create key: source_name, body: File.open source_file
      end
      
    end

    def clean_remote(container,keep_files)
      
      p "clean remote"

      @container.files.each do |file|
        p file
        #file.destroy unless keep_files.include?(file)
      end
    end

  end
end