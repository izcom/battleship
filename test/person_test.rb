require 'minitest/autorun'
require 'minitest/pride'
require './lib/person'

class GameTest < Minitest::Test
  def test_person_instance_can_exist
    person_one = Person.new
    assert_instance_of Person, person_one
  end
end
