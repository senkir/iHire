class PositionsSearchController < ApplicationController
  def index
    @title = "Open Position Search Controller"
    #grab a list of properties for the dropdowns
    @locations = Position.find(:all, :select => "DISTINCT(location)").map(&:location)
    #@locations = array_from_position_attribute(location)
    @departments = Position.find(:all, :select => "DISTINCT(department)").map(&:department)
    #@test_text = put_some_text "Hello"
  end

  def results
    @positions = Position.all
    
  end

  def detail
  end

end
