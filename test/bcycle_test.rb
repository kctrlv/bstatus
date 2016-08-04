require 'minitest/autorun'
require 'minitest/pride'
require './lib/bcycle'

class BCycleTest < Minitest::Test
  def test_it_exists
    assert BCycle
  end

  def test_it_can_validate_city
    assert BCycle.new('denver')
    assert BCycle.new('boulder')
  end


end
