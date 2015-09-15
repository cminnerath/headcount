require 'csv'

class StateWideTestingLoader
  attr_accessor :third_grade_proficiency, :fourth_grade_proficiency,
                :eighth_grade_proficiency

  def load_all
    @third_grade_proficiency ||= load_third_grade_proficiency
    @fourth_grade_proficiency ||= load_fourth_grade_proficiency
    @eighth_grade_proficiency ||= load_eighth_grade_proficiency
  end

  def load_third_grade_proficiency(file = './data/3rd grade students scoring proficient or above on the CSAP_TCAP.csv')
    @third_grade_proficiency = CSV.open(file, headers: true, header_converters: :symbol)
                                  .map { |row| row.to_hash }
  end

  def load_fourth_grade_proficiency(file = './data/4th grade students scoring proficient or advanced on CSAP_TCAP.csv')
    @fourth_grade_proficiency = CSV.open(file, headers: true, header_converters: :symbol)
                                  .map { |row| row.to_hash }
  end

  def load_eighth_grade_proficiency(file = './data/8th grade students scoring proficient or above on the CSAP_TCAP.csv')
    @eighth_grade_proficiency = CSV.open(file, headers: true, header_converters: :symbol)
                                  .map { |row| row.to_hash }
  end
end
