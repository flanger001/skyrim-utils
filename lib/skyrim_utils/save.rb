# frozen_string_literal: true

using StringExtensions

module SkyrimUtils
  Save = Struct.new(
    :full_path,
    :filename,
    :character_name,
    :modded,
    :save_type,
    :character_hash,
    :location,
    :level,
    :time_played,
    :save_time,
    :extras,
    keyword_init: true
  ) do
    TIME_REGEX = /(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})(\d{2})/

    def self.from(base_path, filename)
      return if filename == "steam_autocloud.vdf"

      save_type, character_hash, modded, character_name_hex, location, time_played, save_timestamp, level, extras = filename.split("_")
      # It was this or an array allocation. If your filename breaks this, you're on your own.
      return unless !!save_type &&
       !!character_hash &&
       !!modded &&
       !!character_name_hex &&
       !!location &&
       !!time_played &&
       !!save_timestamp &&
       !!level &&
       !!extras
      save_time = Time.new(*save_timestamp.split(TIME_REGEX)[1..])
      modded_label = modded === "1" ? true : false
      character_name = character_name_hex.hex_to_ascii
      full_path = File.join(base_path, filename)
      new(
        full_path:,
        filename:,
        character_name:,
        modded: modded_label,
        save_type:,
        character_hash:,
        location:,
        level:,
        time_played:,
        save_time:,
        extras:
      )
    end
  end
end
