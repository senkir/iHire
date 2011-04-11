class GeneralAnswer < ActiveRecord::Base
  belongs_to :person
  has_one :general_question # fk - general_question_id
validates_presence_of :answer

end
