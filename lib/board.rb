require 'pry'
require './lib/space'

class Board
  def initialize
    @rows = []
    @rows = assign_hash_to_board
  end

  # creates hashes with space instances
  def assign_hashes_to_board
    4.times
      4.times.with_index do |index|
        @rows << { 'A' + (index + 1).to_s => Space.new }
        @rows << { 'B' + (index + 1).to_s => Space.new }
        @rows << { 'C' + (index + 1).to_s => Space.new }
        @rows << { 'D' + (index + 1).to_s => Space.new }
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
    4.times.with_index(offset = 0) do |index|
      ascii_char = (ascii_index + index).chr
      4.times.with_index(offset = 1) do |count|
        print :"#{ascii_char}"[count]
      end
      print "\n"
    end
  end
end
