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

  def test_that_ships_are_on_board
    game = Game.new
    board = Board.new
    game.create_ships
    game.assign_ships

    game.ships.each do |ship|
      assert(ship.starting_point[0].between('A', 'D'))
      assert(ship.starting_point[1].between(1, 4))
    end
  end

  def test_if_ships_overlap; end

  def test_ships_can_be_vertical_and_horizontal; end
end
