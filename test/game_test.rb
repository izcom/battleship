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
    modded_board = game.remove_unavailable_spaces(modded_board) # modifies length
    result = modded_board.row.count
    expected = 15
    assert_equal expected, result
  end

  def test_place_computer_ships
    game = Game.new
    board = Board.new
    ship_exists = []
    ships = game.create_ships
    game.place_computer_ships(board, ships)
    board.row.each do |hash|
      if hash.values[0].ship == ship_one
        ship_exists[0] << true
      elsif hash.values[1].ship == ship_two
        ship_exists[1] << true
      elsif hash.values[2].ship == ship_three
        ship.exists[2] << true
      end
    end
    assert ship.exists = [true, true, true]
  end

  # def test_place_person_ships
  #
  # end


end
