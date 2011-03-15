require 'test_helper'

class PositionsTest < ActiveSupport::TestCase

  #Assert that the product is not valid with empty data.
  test "Position attributes must not be empty" do
    position = Position.new
	assert position.invalid?
	assert position.errors[:title].any?, "Failed in Title"
	assert position.errors[:department].any?, "Failed in department"
	assert position.errors[:description].any?, "Failed in description"
	assert position.errors[:location].any?, "Failed in location"
	assert !position.errors[:is_open].any?, "Failed in is_open"
	  /It seems that boolean fields automatically are assigned a value.  Therefore, they will not
	  produce an error under normal circumstances./
  end
  
  #Assert that positions can take be given normal values.
  test "Position attributes can accept normal attributes" do
    position = Position.new(:title		 => "Intern Wrangler",
							:department  => "Recruitment",
							:description => "Find and corral interns.",
							:location    => "The Intern Emporium.",
							:is_open     => true)
							
	assert position.valid?
  end
end
