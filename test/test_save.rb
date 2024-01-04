# frozen_string_literal: true

require "test_helper"

class SkyrimUtilsSaveTest < Minitest::Test
  def test_save_from_decodes_save_file
    save = SkyrimUtils::Save.from(
      "/mnt/c/Users/Example User/Documents/My Games/Skyrim Special Edition/Saves",
      "Autosave3_766E09A6_0_42617A7269636B_RiverwoodGerdursHouse_000121_20231226194354_1_1.skse"
    )
    assert_equal("/mnt/c/Users/Example User/Documents/My Games/Skyrim Special Edition/Saves/Autosave3_766E09A6_0_42617A7269636B_RiverwoodGerdursHouse_000121_20231226194354_1_1.skse", save.full_path)
    assert_equal("Autosave3_766E09A6_0_42617A7269636B_RiverwoodGerdursHouse_000121_20231226194354_1_1.skse", save.filename)
    assert_equal("Bazrick", save.character_name)
    assert_equal(false, save.modded)
    assert_equal("Autosave3", save.save_type)
    assert_equal("766E09A6", save.character_hash)
    assert_equal("RiverwoodGerdursHouse", save.location)
    assert_equal("1", save.level)
    assert_equal("000121", save.time_played)
    assert_equal(Time.new(2023, 12, 26, 19, 43, 54, "-0500"), save.save_time)
    assert_equal("1.skse", save.extras)
  end

  def test_save_from_ignores_steam_autocloud
    save = SkyrimUtils::Save.from(
      "/mnt/c/Users/Example User/Documents/My Games/Skyrim Special Edition/Saves",
      "steam_autocloud.vdf"
    )
    assert_nil(save)
  end

  def test_save_from_ignores_other_files
    save = SkyrimUtils::Save.from(
      "/mnt/c/Users/Example User/Documents/My Games/Skyrim Special Edition/Saves",
      "my_good_mod_1.txt"
    )
    assert_nil(save)
  end
end
