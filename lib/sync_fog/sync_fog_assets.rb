# SyncFog Gem
# https://github.com/ben-ole/sync_fog
# Benjamin Müller
# 2015

module SyncFog
  class SyncFogAssets

    def initialize

    end

    def list(dir=".")

      root_path = Pathname.new File.expand_path('..',dir) # one dir up
      files = []

      Dir.glob("#{dir}/**/*") do |file|
        path = Pathname.new file
        files << path.relative_path_from(root_path) unless %w(. ..).include?(file)
      end

      SyncFog.configuration.use_gzip ? filter_zip(files) : files
    end


    ## Helper
    def filter_zip(files)
      files_copy = files
      files_strings = files.map{|f| f.to_s}

      Parallel.map(files, in_threads: @num_threads) do |file|

        # remove files which have an gz equivalent
        unless File.extname(file) != ".gz" &&
               files_strings.include?( "#{file.to_s}.gz" )
           
           files_copy << file
        end
      end

      files_copy
    end

  end
end