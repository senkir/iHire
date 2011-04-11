class GeneralAnswer < ActiveRecord::Base
  belongs_to :person # fk - person_id
  belongs_to :general_questions # fk - general_question_id
validates_presence_of :answer

end
