# SyncFog Gem
# https://github.com/ben-ole/sync_fog
# Benjamin Müller
# 2015
namespace :sync_fog do

  desc "sync assets with fog container"
  task sync: :environment do

    SyncFog.sync
  end

  desc "get public url of container"
  task url: :environment do

    SyncFog.public_url
  end

end

Rake::Task["assets:clean"].enhance do
  Rake::Task["sync_fog:sync"].invoke
end

