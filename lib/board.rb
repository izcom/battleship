require './lib/space'
require 'pry'

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

  def determine_ship_end_point(start_point)
    possible_points = []
    possible_points << check_above_start_point
    possible_points << check_below_start_point
    possible_points << check_left_of_start_point
    possible_points << check_right_of_start_point
    possible_points = possible_points.select { |point| point = true }
    end_point = possible_points.sample
  end

  def return_end_point_distance(ship_length)
    distance = 1
    if ship_length == 3
      distance = 2
    end
    return distance
  end

  def check_above_start_point(start_point, return_end_point_length)
    up_char = (start_point[0].to_i - return_end_point_length).chr
    up_one = up_char + start_point[1].to_s
    if up_one.includes?(64) # '@'
      return false
    elsif up_one.values.contains_ship == true
      return false
    end
    return up_one
  end

  def check_below_start_point(start_point, return_end_point_length)
    below_char = (start_point[0].to_i + return_end_point_length).chr
    below_one = below_char + start_point[1].to_s
    if below_one.includes?(69) # 'E'
      return false
    end
    if below_one.values.contains_ship == true
      return false
    end
  end

  def check_left_of_start_point(start_point, return_end_point_length)
    left_num = start_point[1] - return_end_point_length
    left_one = start_point[0] + left_num.to_s

    if left_num == 0 || left_num == -1
      return false
    end
    if left_one.values.contains_ship == true
      return false
    end
  end

  def check_right_of_start_point(start_point, return_end_point_length)
    right_num = start_point[1] + return_end_point_length
    right_one = start_point[0] + right_num.to_s

    if right_num == 5 || right_num == 6
      return false
    end
    if right_one.values.contains_ship == true
      return false
    end
  end
end
