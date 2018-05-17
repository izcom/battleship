require 'minitest/autorun'
require 'minitest/pride'
require './lib/draw'

class GameTest < Minitest::Test
  def test_draw_instance_can_exist
    draw = Draw.new
    assert_instance_of Draw, draw
  end
end
