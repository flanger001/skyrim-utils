# frozen_string_literal: true

require "test_helper"

class SkyrimUtilsDatabaseTest < Minitest::Test
  def setup
    @dirname = "test_dir"
  end

  def test_database_loads_save_files
    files = [
      "Autosave1_18157607_0_5A75726A61_Tamriel_001012_20200106041826_6_1.ess",
      "Save9_88B900FE_0_47726F646F72_Tamriel_030822_20180107021823_32_1.ess",
    ]

    Dir.stub(:children, files) do
      database = SkyrimUtils::Database.new(@dirname)
      assert_equal(2, database.backend.length)
      database.backend.each do |save|
        assert_instance_of(SkyrimUtils::Save, save)
      end
      assert_equal(@dirname, database.base_path)
    end
  end
  def test_database_rejects_non_save_files
    files = [
      "steam_autocloud.vdf",
      "random_file.jpg"
    ]

    Dir.stub(:children, files) do
      database = SkyrimUtils::Database.new(@dirname)
      assert_equal(0, database.backend.length)
    end
  end
end
