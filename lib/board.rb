require 'pry'
require './lib/space'

class Board

  def initialize
    @rows = [[],[],[],[]]
    @rows = assign_hash_to_board
  end

  # creates hashes with nils A[1] => nil, A[2] => nil...B1 => nil...etc
  def assign_hash_to_board
    @rows.each.with_index(offset = 1) do |index|
      @rows = [
        { :A => {:A[index] => Space.new},
          :B => {:B[index] => Space.new},
          :C => {:C[index] => Space.new},
          :D => {:D[index] => Space.new} }]
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
