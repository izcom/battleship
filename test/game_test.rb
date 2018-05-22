require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'
require './lib/board'
require 'pry'

class GameTest < Minitest::Test
  def test_game_instance_can_exist
    game = Game.new
    assert_instance_of Game, game
  end

  def test_remove_unavailable_spaces_method
    game = Game.new
    board = Board.new
    modded_board = board.dup
    assert_equal board.row.count, 16 # starting length
    board.row[0]['A1'].contains_ship = true
    modded_board = game.remove_unavailable_spaces(modded_board)
    result = modded_board.row.count
    expected = 15
    assert_equal expected, result
  end

  def test_place_computer_ships
    game = Game.new
    board = Board.new
    ship_exists = []
    ships = game.create_ships
    length = 2
    game.place_computer_ships(board, ships, length)
    board.row.each do |coord|
      if coord.values[0].ship == ships[0]
        ship_exists << true
      elsif coord.values[0].ship == ships[1]
        ship_exists << true
      elsif coord.values[0].ship == ships[2]
        ship.exists << true
      end
    end
    assert ship_exists == [true, true, true]
  end

  def test_place_person_ships
    skip
    game = Game.new
    board = Board.new
    ship_exists = []
    ships = game.create_ships
    user_input = game.get_user_input
    game.place_person_ships(board, user_input, ships)

    board.row.each do |h|
      if h.values[0].ship == ships[0]
        ship_exists << true
      elsif h.values[0].ship == ships[1]
        ship_exists << true
      elsif h.values[0].ship == ships[2]
        ship.exists << true
      end
    end
    assert ship_exists = [true, true, true]
  end
end
