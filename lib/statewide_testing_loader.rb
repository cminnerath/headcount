require 'csv'

class StateWideTestingLoader
  attr_accessor :third_grade_proficiency, :map

  def load_all
    @third_grade_proficiency ||= load_third_grade_proficiency
    @third_grade_proficiency = @third_grade_proficiency.to_a.map {|row| row.to_hash }
  end

  def load_third_grade_proficiency(file = "./data/3rd grade students scoring proficient or above on the CSAP_TCAP.csv")
    CSV.open(file, headers: true, header_converters: :symbol)
  end
end