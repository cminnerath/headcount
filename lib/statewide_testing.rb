require 'csv'
require_relative 'statewide_testing_loader'

class Array

end

class StateWideTesting
  attr_accessor :state, :prof, :output

  def initialize(name = nil)
    @state = StateWideTestingLoader.new
    @state.load_all
    @third_grade = @state.third_grade_proficiency.select! { |hash| parse(hash, name)}
    @eighth_grade = @state.eighth_grade_proficiency.select! { |hash| parse(hash, name)}
  end

  def parse(hash, name)
     hash[:location] == name
  end

  def proficient_by_grade(grade = nil)
    if grade == 3
       data_by_year = @third_grade.group_by { |data| data[:timeframe] }
       @output = {}
       data_by_year.each do |k, v|
         scores = []
         v.each { |hash| scores << {hash[:score].downcase.to_sym => hash[:data].to_f}}
         @output[k.to_i] = scores[0].merge(scores[1]).merge(scores[2])
       end
     elsif grade == 8
       data_by_year = @eighth_grade.group_by { |data| data[:timeframe] }
       @output = {}
       data_by_year.each do |k, v|
         scores = []
         v.each { |hash| scores << {hash[:score].downcase.to_sym => hash[:data].to_f}}
         @output[k.to_i] = scores[0].merge(scores[1]).merge(scores[2])
       end
     else
       @output =  "Error: Grade Not Found"
     end
     @output
   end

   def proficient_by_grade_in_year(subject, grade, year)
     if grade == 3
       hash = proficient_by_grade(grade)
       value_year = hash.fetch(year)
       value_year.fetch(subject)
     elsif grade == 8
       hash = proficient_by_grade(grade)
       value_year = hash.fetch(year)
       value_year.fetch(subject)
     else
       return "Error: Grade Not Found"
     end
   end

   def proficient_for_subject_in_year(subject, year)
     if subject == :reading || :math || :reading
       three = proficient_by_grade(3)
       eight = proficient_by_grade(8)
       third = three.fetch(year)
       eighth = eight.fetch(year)
       x = eighth.fetch(subject)
       y = third.fetch(subject)
       (x + y) / 2
     else
     "UnknownDataError"
   end
  end
end