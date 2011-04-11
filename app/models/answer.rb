class Answer < ActiveRecord::Base
  belongs_to :person
validates_presence_of :answer

end
