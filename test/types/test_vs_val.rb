# frozen_string_literal: true

require "test_helper"

class TestVsVal < Minitest::Test
  def test_uint8
    bytes = [0b11100000]
    vs_val = SkyrimUtils::Types::VsVal.from(bytes)
    assert_equal(:uint8, vs_val.size)
    assert_equal(0b00111000, vs_val.value )
  end

  def test_uint16
    bytes = [0b11100001, 0b00010011]
    vs_val = SkyrimUtils::Types::VsVal.from(bytes)
    assert_equal(:uint16, vs_val.size)
    assert_equal(0b00000100_11111000, vs_val.value)
  end

  def test_uint32
    bytes = [0b11100010, 0b00010011, 0b10010011]
    vs_val = SkyrimUtils::Types::VsVal.from(bytes)
    assert_equal(:uint32, vs_val.size)
    assert_equal(0b00100100_11000100_11111000, vs_val.value)
  end
end

