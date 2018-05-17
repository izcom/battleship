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

  def test_if_ships_overlap

  end

  def test_that_ships_are_on_board

  end

  def test_ships_can_be_vertical_and_horizontal

  end
end
