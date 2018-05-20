require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'

class BoardTest < Minitest::Test
  def test_board_instance_can_exist
    board = Board.new
    assert_instance_of Board, board
  end

  def test_can_draw_board
    board = Board.new
    result = board.draw_board
    expected = ''

    # assert_equal expected, result
  end

  def test_if_ships_overlap; end

  def test_that_ships_are_on_board; end

  def test_ships_can_be_vertical_and_horizontal; end
end
