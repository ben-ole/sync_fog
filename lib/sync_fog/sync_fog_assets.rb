# SyncFog Gem
# https://github.com/ben-ole/sync_fog
# Benjamin Müller
# 2015

module SyncFog
  class SyncFogAssets

    def initialize

    end

    def list(dir=".")

      root_path = Pathname.new dir
      files = []

      Dir.glob("#{dir}/**/*") do |file|
        path = Pathname.new file
        files << path.relative_path_from(root_path) unless %w(. ..).include?(file)
      end

      files
    end

  end
end