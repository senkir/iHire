class PositionSpecificAnswer < ActiveRecord::Base
  belongs_to :person #fk - person_id
  belongs_to :position_specific_question #fk - position_specific_question_id
  validates_presence_of :answer
end
