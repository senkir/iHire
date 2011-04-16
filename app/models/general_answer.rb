class GeneralAnswer < ActiveRecord::Base
  belongs_to :person # fk - person_id
  belongs_to :general_question # fk - general_quesiton_id
validates_presence_of :answer

end
