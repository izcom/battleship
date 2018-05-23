class Ship
  attr_accessor :health

  def initialize(length)
    @health = length
  end

  def take_hit
    @health -= 1
  end
end
