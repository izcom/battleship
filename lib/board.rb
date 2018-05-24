require './lib/space'
require 'pry'

class Board
  attr_accessor :rows

  def initialize
    @rows = []
    @rows = assign_hashes_to_board
    @ships = []
  end

  # creates hashes with space instances as values
  def assign_hashes_to_board
      4.times.with_index do |index|
        @rows << { 'A' + (index + 1).to_s => Space.new }
        @rows << { 'B' + (index + 1).to_s => Space.new }
        @rows << { 'C' + (index + 1).to_s => Space.new }
        @rows << { 'D' + (index + 1).to_s => Space.new }
      end
      @rows
  end

  def draw_board_top
    puts `clear`
    top = """
          ===========
          . 1 2 3 4
          """
    print top
  end

  def draw_board_bottom
    print '==========='
  end

  def draw_board_content
    grid = []
     16.times do
       grid << []
     end
     @rows.each.with_index do |row, index|
       grid[index] << @rows[index].values[0].display_char
     end
  end

  def draw_board
    draw_board_top
    draw_board_content
    draw_board_bottom
  end

  def determine_ship_start_point
    possible_points = []
    fake_rows = @rows.dup
    possible_points = fake_rows.select { |row| row[row.keys[0]].contains_ship == false }
  end

  def determine_ship_end_point(start_point, length)
    possible_points = []
    possible_points << check_above_start(start_point, length)
    possible_points << check_below_start(start_point, length)
    possible_points << check_left_of_start(start_point, length)
    possible_points << check_right_of_start(start_point, length)
    possible_points = possible_points.select { |point| point != false }
    end_point = possible_points.sample
  end

  def check_above_start(start_point, length)
    up_char = (start_point[0].ord - (length - 1)).chr
    if up_char == '@' || up_char == '?'
      return false
    end
    up_one = up_char + start_point[1].to_s
    location = @rows.select { |row| row.keys[0] == up_one }
    if location[0].values[0].contains_ship == true
      return false
    end
    return up_one
  end

  def check_below_start(start_point, length)
    below_char = (start_point[0].ord + (length - 1)).chr
    if below_char == 'E' || below_char == 'F'
      return false
    end
    below_one = below_char + start_point[1].to_s
    location = @rows.select { |row| row.keys[0] == below_one }
    if location[0].values[0].contains_ship == true
      return false
    end
    return below_one
  end

  def check_left_of_start(start_point, length)
    left_num = start_point[1].to_i - length
    left_one = start_point[0] + left_num.to_s
    if left_num == 0 || left_num == -1 || left_num == -2
      return false
    end
    location = @rows.select { |row| row.keys[0] == left_one }
    if location[0].values[0].contains_ship == true
      return false
    end
    return left_one
  end

  def check_right_of_start(start_point, length)
    right_num = start_point[1].to_i + (length - 1)
    if right_num == 5 || right_num == 6
      return false
    end
    right_one = start_point[0] + right_num.to_s
    location = @rows.select { |row| row.keys[0] == right_one }

    if location[0].values[0].contains_ship == true
      return false
    end
    return right_one
  end
end
