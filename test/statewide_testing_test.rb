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

  def setup
  @third_grade_results =  {2008=>{:math=>0.798, :reading=>0.838, :writing=>0.556},
                           2009=>{:math=>0.769, :reading=>0.799, :writing=>0.616},
                           2010=>{:math=>0.715, :reading=>0.76, :writing=>0.515},
                           2011=>{:math=>0.708, :reading=>0.739, :writing=>0.503},
                           2012=>{:reading=>0.824, :math=>0.818, :writing=>0.59893},
                           2013=>{:math=>0.72, :reading=>0.78035, :writing=>0.50575},
                           2014=>{:math=>0.7006, :reading=>0.76364, :writing=>0.51497}}

  @eighth_grade_results = {2008=>{:math=>0.523, :reading=>0.795, :writing=>0.636},
                           2009=>{:math=>0.59, :reading=>0.748, :writing=>0.573},
                           2010=>{:math=>0.639, :reading=>0.813, :writing=>0.0},
                           2011=>{:reading=>0.79412, :math=>0.59244, :writing=>0.67647},
                           2012=>{:math=>0.52239, :writing=>0.56219, :reading=>0.79104},
                           2013=>{:math=>0.53589, :reading=>0.76555, :writing=>0.66029},
                           2014=>{:math=>0.54976, :reading=>0.70283, :writing=>0.58962}}
  end

  def test_it_can_find_proficiency_in_a_district_by_grade
    testload = StateWideTesting.new('WOODLAND PARK RE-2')
    testvar = testload.proficient_by_grade(3)
    assert_equal @third_grade_results, testload.output
    testload.proficient_by_grade(8)
    assert_equal @eighth_grade_results, testload.output
    testload.proficient_by_grade(9)
    assert_equal "Error: Grade Not Found", testload.output
    testload.proficient_by_grade("a")
    assert_equal "Error: Grade Not Found", testload.output
    testload.proficient_by_grade
    assert_equal "Error: Grade Not Found", testload.output
  end

  def test_it_can_find_proficiency_in_a_subject_by_grade
    testload = StateWideTesting.new('WOODLAND PARK RE-2')
    assert_equal 0.838, testload.proficient_by_grade_in_year(:reading, 3, 2008)
    assert_equal 0.818, testload.proficient_by_grade_in_year(:math, 3, 2012)
    assert_equal 0.52239, testload.proficient_by_grade_in_year(:math, 8, 2012)
    assert_equal 0.67647, testload.proficient_by_grade_in_year(:writing, 8, 2011)
    assert_equal "Error: Grade Not Found", testload.proficient_by_grade_in_year(:math, 156, 2012)
  end
end