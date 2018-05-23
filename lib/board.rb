require './lib/space'
require 'pry'

class Board
  attr_reader :row

  def initialize
    @row = []
    @row = assign_hashes_to_board
    @ships = []
  end

  # creates hashes with space instances as values
  def assign_hashes_to_board
      4.times.with_index do |index|
        @row << { 'A' + (index + 1).to_s => Space.new }
        @row << { 'B' + (index + 1).to_s => Space.new }
        @row << { 'C' + (index + 1).to_s => Space.new }
        @row << { 'D' + (index + 1).to_s => Space.new }
      end
      return @row
  end

  def draw_board
    puts `clear`
    top_line = '===========' + "\n"
    numbers = ". 1 2 3 4\n"
    spaces = draw_board_letters + "\n"
    bottom_line = '==========='
    return top_line + numbers + spaces + bottom_line
  end

  def draw_board_letters
    ascii_index = 65 # 'A'
    char_str = ''
    4.times.with_index do |index|
      ascii_index += 1
      ascii_char = ascii_char.chr
      4.times.with_index(offset = 1) do |count|
        char_str += ascii_char
      end
    end
    return char_str
  end

  def determine_ship_start_point
    possible_points = []
  end

  def determine_ship_end_point(start_point, length, board)
    possible_points = []
    possible_points << check_above_start(start_point, length, board)
    possible_points << check_below_start(start_point, length, board)
    possible_points << check_left_of_start(start_point, length, board)
    possible_points << check_right_of_start(start_point, length, board)
    possible_points = possible_points.select { |point| point != false }
    end_point = possible_points.sample
  end

  def check_above_start(start_point, length, board)
    up_char = (start_point[0].ord - (length - 1)).chr
    if up_char == '@'
      return false
    end
    up_one = up_char + start_point[1].to_s
    location = board.row.select { |h| h.keys[0] == up_one }
    if location[0].values[0].contains_ship == true
      return false
    end
    return up_one
  end

  def check_below_start(start_point, length, board)
    below_char = (start_point[0].ord + (length - 1)).chr
    if below_char == 'E'
      return false
    end
    below_one = below_char + start_point[1].to_s
    location = board.row.select { |h| h.keys[0] == below_one }

    if location[0].values[0].contains_ship == true
      return false
    end
    return below_one
  end

  def check_left_of_start(start_point, length, board)
    left_num = start_point[1].to_i - length
    left_one = start_point[0] + left_num.to_s
    location = board.row.select { |h| h.keys[0] == left_one }

    if left_num == 0 || left_num == -1
      return false
    end
    if location[0].values[0].contains_ship == true
      return false
    end
    return left_one
  end

  def check_right_of_start(start_point, length, board)
    right_num = start_point[1].to_i + length
    right_one = start_point[0] + right_num.to_s
    location = board.row.select { |h| h.keys[0] == right_one }

    if right_num == 5 || right_num == 6
      return false
    end
    if location[0].values[0].contains_ship == true
      return false
    end
    return right_one
  end
end
