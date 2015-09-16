require 'csv'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/statewide_testing'

class StateWideTestingTest < Minitest::Test
  def test_it_can_see_the_instance_variables_from_the_loader
    testload = StateWideTesting.new
    assert Hash, testload.state.third_grade_proficiency.first
  end
end