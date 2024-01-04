# frozen_string_literal: true

module SkyrimUtils
  module Types
    class VsVal
      SIZES = {
        0b00 => :uint8,
        0b01 => :uint16,
        0b10 => :uint32,
      }
      attr_reader :value, :size

      def initialize(value, size)
        @value = value
        @size = size
      end

      class << self
        def from(bytes)
          type = bytes.first[0, 2]
          size = SIZES[type]
          value = case size
          when :uint8
            bytes[0]
          when :uint16
            bytes[0] | (bytes[1] << 8)
          when :uint32
            bytes[0] | (bytes[1] << 8) | (bytes[2] << 16)
          else
            raise "Not a valid vsval"
          end
          new((value >> 2), size)
        end
      end
    end
  end
end
