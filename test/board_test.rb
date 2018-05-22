require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'
require './lib/game'

class BoardTest < Minitest::Test
  def test_board_instance_can_exist
    board = Board.new
    assert_instance_of Board, board
  end

  def test_can_draw_board
    board = Board.new
    result = board.draw_board
    expected = '==========='
               '. 1 2 3 4'
               'A'\
               'B'\
               'C'\
               'D'\
               '==========='
    expected = puts expected # adds newline
    assert_equal expected, result
  end

  def test_computer_ships_are_on_board
    game = Game.new
    board = Board.new
    computer_ships = game.create_ships
    game.place_computer_ships(board, computer_ships)

  end

  def test_if_ships_overlap; end

  def test_ships_can_be_vertical_and_horizontal; end
end
