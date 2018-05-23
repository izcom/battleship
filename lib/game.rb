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
    place_computer_ships(@comp_board, ships)
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

  def print_prompt_for_two_unit_ship
    prompt = """
      I have laid out my ships on the grid. You now need to layout
      your two ships. The first is two units long and the second is
      three units long. The grid has A1 at the top left and D4 at
      the bottom right.

      Enter the squares for the two-unit ship:
      """
    print prompt
  end

  def print_board_squares

  end

  def place_person_ships(board, user_input, ships)
    user_input = user_input.split(' ')
    location = board.row.select { |h| h.keys[0] == user_input[0] }

    location[0].values[0].assign_ship(1, ships)
    location[0].values[0].contains_ship = true

    location = board.row.select { |h| h.keys[0] == user_input[1] }
    location[0].values[0].assign_ship(2, ships)
    location[0].values[0].contains_ship = true

    location = user_input[0]
    midpoint = location[0]
    if location[0] == location[1].to_i + 2 # if ship is 3 units
      midpoint = location[1] + location[1] + 1
    end
  end

  def create_ships
    ships = []
    ships << comp_ship_one = Ship.new(2)
    ships << comp_ship_two = Ship.new(3)
    ships << person_ship_one = Ship.new(2)
    ships << person_ship_two = Ship.new(3)
    return ships
  end

  def place_computer_ships(board, ships, length)
    length.times.with_index do |index|
      modded_board = remove_unavailable_spaces(board)
      rand_coord = modded_board.row.sample # *
      starting_coord = rand_coord.keys[0]
      ending_coord = board.determine_ship_end_point(starting_coord, length, board)
      midpoint_coord = add_midpoint_coord(starting_coord, ending_coord)

      store_ship(board, index + 1, ships, starting_coord)
      store_ship(board, index + 1, ships, midpoint_coord)
      store_ship(board, index + 1, ships, ending_coord)
      end
    end

  def add_midpoint_coord(starting_coord, ending_coord)
    midpoint_coord = ''
    # if ship is 3 units horizontal
    if (ending_coord[1].to_i - starting_coord[1].to_i).abs == 2
      midpoint_coord = starting_coord[0] + (starting_coord[1].to_i + 1).to_s
      return midpoint_coord
    # if ship is 3 units vertical
    elsif (ending_coord[0].ord - starting_coord[0].ord).abs == 2
      midpoint_coord = starting_coord[0].next + starting_coord[1].to_s
      return midpoint_coord
    end
    return false # no midpoint
  end

  def store_ship_in_space(board, ship_num, ships, coord)
    key = board.row.select { |hash| hash.keys[0] == coord }
    key[0][coord].assign_ship(ship_num, ships)
    key[0][coord].contains_ship = true
    key[0][coord].ship = ships[ship_num]
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
