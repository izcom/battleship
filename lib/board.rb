require 'pry'

class Board

  def initialize
    @rows = []
    @rows = assign_hash_to_board
  end

  # creates hashes with nils A[1] => nil, A[2] => nil...B1 => nil...etc
  def assign_hash_to_board
    4.times.with_index(offset = 1) do |row_number|
      4.times.with_index(offset = 1) do |index|
      symbol_identifier = 'A' + [index].to_s
      "#{symbol_identifier = Hash.new}"
      [:"#{symbol_identifier}"] = nil
      @rows[row_number] << "#{symbol_identifier}"

      end
    end
  end

  def draw_board
    puts `clear`
    print "===========\n"
    print ". 1 2 3 4\n"
    loop.with_index do |index|
      ascii_index = 41 # 'A'
      binding.pry
    print (ascii_index + index).chr
    end
    loop.with_index do |index|
      print :A[index]
    end
    print '==========='
  end
end
