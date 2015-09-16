require 'csv'
require_relative 'statewide_testing_loader'

class StateWideTesting
  attr_accessor :state

  def initialize
    @state = StateWideTestingLoader.new
    @state.load_all
  end
end