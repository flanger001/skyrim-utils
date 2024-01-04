# frozen_string_literal: true

require "test_helper"

using StringExtensions

class TestStringExtensions < Minitest::Test
  def test_hex_to_ascii_converts_1
    str = "42617A7269636B"
    assert_equal("Bazrick", str.hex_to_ascii)
  end

  def test_hex_to_ascii_converts_2
    str = "47726F646F72"
    assert_equal("Grodor", str.hex_to_ascii)
  end

  def test_hex_to_ascii_unpacks
    str = "G"
    assert_equal("\x00", str.hex_to_ascii)
  end

  def test_ascii_to_hex_converts
    str = "Bazrick"
    assert_equal("42617A7269636B", str.ascii_to_hex)
  end
end
