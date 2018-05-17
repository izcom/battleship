require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'

class GameTest < Minitest::Test
  def test_game_instance_can_exist
    game = Game.new
    assert_instance_of Game, game
  end
end
