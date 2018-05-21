require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'
require 'expect'

class GameTest < Minitest::Test
  def test_game_instance_can_exist
    game = Game.new
    assert_instance_of Game, game
  end

  def test_print_title_screen
    game = Game.new
    game.print_title_screen
    # mock this in future implementation
  end

  def test_return_available_spaces_method
    ship_one = Ship.new(2)
    board = Board.new
    game = Game.new

    result = game.return_available_spaces(board)
    expected =

    assert_equal expected, result
  end
end
