require 'csv'
require_relative 'statewide_testing_loader'

class StateWideTesting
  attr_accessor :state

  def initialize(name = nil)
    @state = StateWideTestingLoader.new
    @state.load_all
    @state.third_grade_proficiency.select! { |hash| parse(hash, name)}
  end

  def parse(hash, name)
     hash[:location] == name
  end
end