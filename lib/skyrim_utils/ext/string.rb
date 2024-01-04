# frozen_string_literal: true

module StringExtensions
  refine String do
    def hex_to_ascii
      [self].pack("H*")
    end

    def ascii_to_hex
      unpack("H*").first.upcase
    end
  end
end
