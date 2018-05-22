require './lib/board'
require './lib/ship'
require './lib/person'
require './lib/computer'
require 'pry'

class Game
  def initialize
    @person_board = Board.new
    @computer_board = Board.new
    @person = Person.new
    @computer = Computer.new
  end

  def start
    ships = create_ships
    place_computer_ships(ships)
  end

  def print_title_screen
    print "Welcome to BATTLESHIP\n\n"
    print "Would you like to (p)lay, read the (i)nstructions, or (q)uit?\n"
    print '> '
  end

  def print_instructions
    puts `clear`
    print 'The basic Battleship rules are each player calls out one shot '\
      "(or coordinate) each turn in attempt to hit one\nof their opponents "\
      'ships. To “hit” one of your opponents ships, you must call out a '\
      "letter and a number of\nwhere you think one of their ships is "\
      "located. Ex: A3\n(Press any key to quit)"
      user_input = gets.chomp
  end

  def print_prompt_for_squares
    prompt = """
      I have laid out my ships on the grid.
      You now need to layout your two ships.
      The first is two units long and the
      second is three units long.
      The grid has A1 at the top left and D4 at the bottom right.

      Enter the squares for the two-unit ship:
      """
    print prompt
  end

  def get_user_input
    print_prompt_for_squares
    user_input = gets.chomp
  end

  def create_ships
    ships = []
    ships << comp_ship_one = Ship.new(2)
    ships << comp_ship_two = Ship.new(2)
    ships << comp_ship_three = Ship.new(3)
    ships << person_ship_one = Ship.new(2)
    ships << person_ship_two = Ship.new(2)
    ships << person_ship_three = Ship.new(3)
    return ships
  end

  def place_computer_ships(board, ships)
    length = 2

    3.times.with_index do |index|
      modded_board = remove_unavailable_spaces(board)
      hash = modded_board.row.sample
      starting_coord = hash.keys[0]
      ending_coord = board.determine_ship_end_point(starting_coord, length, board)

      @computer_board.row["#{starting_coord}"].values[0].assign_ship(index + 1, ships)
      if ending_coord[1] == starting_coord[1].to_i + 2 # if ship is 3 units
        midpoint_coord = starting_coord[0] + starting_coord[1] + 1
        length = 3
      elsif ending_coord[0] == starting_coord[1].next.next
        midpoint_coord = starting_coord[0].next + starting_coord[1].to_s
        length = 3
      end
      @computer_board.row["#{ending_coord}"].values[0].assign_ship(index + 1, ships)
      @computer_board.row["#{midpoint_coord}"].values[0].assign_ship(index + 1, ships)
    end
  end

  # flattens board by removing Space instances that contain ships
  def remove_unavailable_spaces(board)
    board.row.each.with_index do |hash, index|
      if hash.values[0].contains_ship == true
        board.row.delete(hash)
      end
    end
    return board
  end
end
