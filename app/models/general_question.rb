class GeneralQuestion < ActiveRecord::Base
  has_many :general_answers
  validates_presence_of :question, :question_type
  #TODO:  validate type of question
  
end
