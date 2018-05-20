require './lib/space'

class Board
  attr_reader :row

  def initialize
    @row = []
    @row = assign_hashes_to_board
  end

  # creates hashes with space instances as values
  def assign_hashes_to_board
    4.times do
      4.times do |index|
        @row << { 'A' + (index + 1).to_s => Space.new }
        @row << { 'B' + (index + 1).to_s => Space.new }
        @row << { 'C' + (index + 1).to_s => Space.new }
        @row << { 'D' + (index + 1).to_s => Space.new }
      end
    end
  end

  def draw_board
    puts `clear`
    print "===========\n"
    print ". 1 2 3 4\n"
    draw_board_spaces
    print '==========='
  end

  def draw_board_spaces
    ascii_index = 65 # 'A'
    4.times.with_index do |index|
      ascii_char = (ascii_index + index).chr
      4.times.with_index(offset = 1) do |count|
        print :"#{ascii_char}"[count]
      end
      puts ''
    end
  end

  def determine_ship_end_point(start_point, ship_length)
    

  end
end
