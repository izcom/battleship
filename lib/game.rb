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

  def create_ships
    ships = []
    ships << computer_ship_one = Ship.new(2)
    ships << computer_ship_two = Ship.new(2)
    ships << computer_ship_three = Ship.new(3)
    ships << person_ship_one = Ship.new(2)
    ships << person_ship_two = Ship.new(2)
    ships << person_ship_three = Ship.new(3)
    return ships
  end

  def place_computer_ships(ships)
    rand_int = rand(1..4)
    binding.pry
    ships.ship_one.starting_point =  @computer_board.row[rand_int]
    binding.pry
    sleep(2)
  end

  def return_available_spaces(board)
    # pass it a flattened board with the Space instances that contain_ships removed
    board = board.row.flatten
  end

end
