class PositionSpecificQuestion < ActiveRecord::Base
  belongs_to :position #fk - position_id
  has_many :position_specific_answers
end
