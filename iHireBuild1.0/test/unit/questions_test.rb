require 'test_helper'

class QuestionsTest < ActiveSupport::TestCase

  #Assert that the class cannot be passed empty values.
  test "Questions attributes must not be empty" do
    question = Question.new
    assert !question.valid?
	assert question.errors[:question].any?
  end

  #Assert that the class will accept normal data.
  test "Questions attributes can accept normal values" do
    question = Question.new(:question => "Are you capable of lifting 50 lbs?")
	assert question.valid?
  end
  
end