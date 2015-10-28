module SyncFog
  class SyncFogAssets

    def initialize
      
    end

    def list(dir=".")
      
      # end
      files = []
      Dir.foreach(dir) do |file|      
        files << File.join( Dir.pwd,file ) unless %w(. ..).include?(file)
      end

      files
    end

  end
end