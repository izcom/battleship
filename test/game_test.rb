require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'
require './lib/board'

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

  def test_remove_unavailable_spaces_method
    board = Board.new
    modded_board = board.dup
    game = Game.new
    assert_equal board.row.count, 16 # starting length

    board.row[0]['A1'].contains_ship = true # A1 hash
    board = game.remove_unavailable_spaces(board) # modifies length
    result = board.row.count
    expected = 15
    assert_equal expected, result
  end

  def test_place_computer_ships
    # do this next
  end
end
