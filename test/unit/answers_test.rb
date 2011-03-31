require 'test_helper'

class AnswersTest < ActiveSupport::TestCase

  #make sure the class does not accept empty values.
  test "Answers attributes must not be empty" do
    answer = Answer.new
	assert !answer.valid?
	assert answer.errors[:name].any?
	assert answer.errors[:answer].any?
  end

  #Make sure the class can accept normal values.
  test "Answers attributes can accept normal values" do
    answer = Answer.new(:name   => "Bob",
	                    :answer => "Yes")
    assert answer.valid?
  end
end
