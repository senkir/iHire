class Address < ActiveRecord::Base
  belongs_to :person # fk - person_id
  belongs_to :school # fk - school_id
  belongs_to :previous_employer # fk previous_employer_id
  validates_presence_of :name

end
