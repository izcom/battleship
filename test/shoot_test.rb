require 'minitest/autorun'
require 'minitest/pride'
require './lib/shoot'

class GameTest < Minitest::Test
  def test_shoot_instance_can_exist
    shoot = Shoot.new
    assert_instance_of Shoot, shoot
  end
end
