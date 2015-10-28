require 'test_helper'


class SyncFogTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::SyncFog::VERSION
  end

  def test_listing_current_assets_folder
    SyncFog::SyncFogAssets.new.list
  end

  def test_sync
    SyncFog.sync
  end
end
