require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'

class GameTest < Minitest::Test
  def test_draw_instance_can_exist
    board = Board.new
    assert_instance_of Board, board
  end
end
