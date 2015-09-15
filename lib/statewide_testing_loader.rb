require 'csv'

class StateWideTestingLoader
  attr_accessor :third_grade_proficiency,     :fourth_grade_proficiency,
                :eighth_grade_proficiency,    :proficiency_by_race_math,
                :proficiency_by_race_reading, :proficiency_by_race_writing

  def load_all
    @third_grade_proficiency      ||= load_third_grade_proficiency
    @fourth_grade_proficiency     ||= load_fourth_grade_proficiency
    @eighth_grade_proficiency     ||= load_eighth_grade_proficiency
    @proficiency_by_race_math     ||= load_proficiency_by_race_math
    @proficiency_by_race_reading  ||= load_proficiency_by_race_reading
    @proficiency_by_race_writing  ||= load_proficiency_by_race_writing
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

  def load_proficiency_by_race_math(file = './data/Average proficiency on the CSAP_TCAP by race_ethnicity_ Math.csv')
    @proficiency_by_race_math = CSV.open(file, headers: true, header_converters: :symbol)
                                   .map { |row| row.to_hash }
  end

  def load_proficiency_by_race_reading(file = './data/Average proficiency on the CSAP_TCAP by race_ethnicity_ Reading.csv')
    @proficiency_by_race_reading = CSV.open(file, headers: true, header_converters: :symbol)
                                   .map { |row| row.to_hash }
  end

  def load_proficiency_by_race_writing(file = './data/Average proficiency on the CSAP_TCAP by race_ethnicity_ Writing.csv')
    @proficiency_by_race_writing = CSV.open(file, headers: true, header_converters: :symbol)
                                   .map { |row| row.to_hash }
  end
end
