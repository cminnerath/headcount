require 'csv'
require 'minitest/autorun'
require 'minitest/pride'
require_relative "../lib/statewide_testing_loader"

class StateWideTestingLoaderTest < Minitest::Test
  def test_it_can_read_a_csv
    testload = StateWideTestingLoader.new
    testload.load_all
    assert CSV, testload
  end

  def test_it_can_turn_the_csv_into_a_hash
    testload = StateWideTestingLoader.new
    testload.load_all
    assert Hash, testload.third_grade_proficiency
  end
end
