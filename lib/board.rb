class Board

  def initialize
    # creates a hash with nil nils
    @row_one = [{:A1 => nil}, {:A2 => nil}, {:A3 => nil}, {:A4 => nil}]
    @row_two = [{:B1 => nil}, {:B2 => nil}, {:B3 => nil}, {:B4 => nil}]
    @row_three = [{:C1 => nil}, {:C2 => nil}, {:C3 => nil}, {:C4 => nil}]
    @row_four = [{:D1 => nil}, {:D2 => nil}, {:D3 => nil}, {:D4 => nil}]
  end

  def draw_board
    puts `clear`

    print '==========='
    print '. 1 2 3 4'
    print '==========='
  end
end
