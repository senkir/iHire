class GeneralQuestion < ActiveRecord::Base
  has_many :general_answers
  validates_presence_of :question
  
end
