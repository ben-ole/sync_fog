# SyncFog Gem
# https://github.com/ben-ole/sync_fog
# Benjamin Müller
# 2015

require "rake"

namespace :sync_fog do

  desc "sync assets with fog container"
  task sync: :environment do

    #file = ARGV.last
    #task file.to_sym do ; end

    p "# SyncFog: uploading files to bucket"
    SyncFog.sync
  end

end
