require './lib/board'
require './lib/ship'
require './lib/person'
require './lib/computer'
require 'pry'

class Game
  attr_reader :ships, :comp_board

  def initialize
    @person_board = Board.new
    @comp_board = Board.new
    @person = Person.new
    @computer = Computer.new
    @ships = create_ships
  end

  def start
    place_computer_ships(@comp_board, ships)
  end

  def print_title_screen
    print "Welcome to BATTLESHIP\n\n"
    print "Would you like to (p)lay, read the (i)nstructions, or (q)uit?\n"
    print '> '
  end

  def print_instructions
    puts `clear`
    prompt = """
      The basic Battleship rules are each player calls out one shot
      (or coordinate) each turn in attempt to hit one of their opponents
      ships. To “hit” one of your opponents ships, you must call out a
      letter and a number of where you think one of their ships is
      located. Ex: A3 (Press any key to quit)
      """
    puts prompt
    user_input = gets.chomp
  end

  def print_prompt_for_two_unit_ship
    puts `clear`
    prompt = """
      I have laid out my ships on the grid. You now need to layout
      your two ships. The first is two units long and the second is
      three units long. The grid has A1 at the top left and D4 at
      the bottom right.

      Enter the squares for the two-unit ship:
      """
    print prompt
  end

  def print_board_squares(board)
    display = []
    board.row.each do |row|
      display << row.display_char
    end
    4.times do
      4.times do
        print space[index] + ' '
      end
      puts '' # newline
    end
  end

  def place_person_ships(user_input, ships)
    user_input = user_input.split(' ')
    location = @person_board.rows.select { |row| h.keys[0] == user_input[0] }

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

  def place_computer_ships
    2.times.with_index do |index|
      mod_board = @comp_board.dup
      rand_coord = mod_board.rows.sample # *
      starting_coord = rand_coord.keys[0]
      ending_coord = @comp_board.determine_ship_end_point(starting_coord, index + 2)
      midpoint_coord = add_midpoint_coord(starting_coord, ending_coord)
      store_ship_in_space(@comp_board, index + 1, starting_coord)
      if !midpoint_coord == ''
        store_ship_in_space(@comp_board, index + 1, midpoint_coord)
      end
      store_ship_in_space(@comp_board, index + 1, ending_coord)
    end
  end

  def add_midpoint_coord(starting_coord, ending_coord)
    midpoint_coord = ''
    # if ship is 3 units horizontal
    if (ending_coord[1].to_i - starting_coord[1].to_i).abs == 2
      midpoint_coord = starting_coord[0] + (starting_coord[1].to_i + 1).to_s
    # if ship is 3 units vertical
    elsif (ending_coord[0].ord - starting_coord[0].ord).abs == 2
      midpoint_coord = starting_coord[0].next + starting_coord[1].to_s
    end
  end

  def store_ship_in_space(board, ship_num, coord)
    key = board.rows.select { |hash| hash.keys[0] == coord }
    key[0][coord].assign_ship(ship_num, @ships)
    key[0][coord].contains_ship = true
    key[0][coord].ship = @ships[ship_num]
  end

  def remove_unavailable_spaces(board)
    board.rows.each.with_index do |hash, index|
      if hash.values[0].contains_ship == true
        board.rows.delete(hash)
      end
    end
    return board
  end

  def hit(board, coord, ship)
    ship.take_hit
    board.row[coord].display_char = 'X'
  end
end
