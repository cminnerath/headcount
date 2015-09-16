require 'csv'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/statewide_testing'

class StateWideTestingTest < Minitest::Test
  def test_it_can_see_the_instance_variables_from_the_loader
    testload = StateWideTesting.new
    assert Hash, testload.state.third_grade_proficiency.first
  end

  def test_it_can_initialize_with_a_district_name
    testload = StateWideTesting.new('WOODLAND PARK RE-2')
    testvar = testload.state.third_grade_proficiency
    assert_equal 'WOODLAND PARK RE-2', testvar.first[:location]
    assert_equal 'WOODLAND PARK RE-2', testvar.last[:location]
    testload = StateWideTesting.new('AKRON R-1')
    testvar = testload.state.third_grade_proficiency
    assert_equal 'AKRON R-1', testvar.first[:location]
    assert_equal 'AKRON R-1', testvar.last[:location]
  end
end