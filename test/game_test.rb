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
    assert_equal board.rows.count, 16 # starting length
    board.rows[0]['A1'].contains_ship = true
    modded_board = game.remove_unavailable_spaces(modded_board)
    result = modded_board.rows.count
    expected = 15
    assert_equal expected, result
  end

  def test_place_computer_ships
    game = Game.new
    ship_exists = []
    game.place_computer_ships
    game.comp_board.rows.each do |row|
      if !row[row.keys[0]].ship.nil?
        if row[row.keys[0]].ship == game.ships[0]
          ship_exists << true
        elsif row[row.keys[0]].ship == game.ships[1]
          ship_exists << true
        end
      end
    end
    assert ship_exists == [true, true]
  end

  def test_place_person_ships
    skip
    game = Game.new
    ship_exists = []
    fake_user_input = 'A1 A2'
    game.place_person_ships(fake_user_input, ships)

    board.row.each do |row|
      if row.values[0].ship == ships[0]
        ship_exists << true
      elsif row.values[0].ship == ships[1]
        ship_exists << true
      elsif row.values[0].ship == ships[2]
        ship.exists << true
      end
    end
    assert ship_exists = [true, true, true]
  end

  def test_hit_updates_board
    skip
    game = Game.new
    board = Board.new
    ships = game.create_ships
    no_hits = board.draw_board
    game.hit(game.ships[0])
    one_hit = board.draw_board
    refute_equal no_hits, one_hit
  end

  def test_miss_updates_board
    skip
    game = Game.new
    board = Board.new
    game.miss(ships[0], coord)
  end

  def test_ship_takes_damage
    game = Game.new
    board = Board.new
    ships = game.create_ships
    assert_equal 2, ships[0].health
    game.hit(ships[0])
    assert_equal 1, ships[0].health
  end
end
