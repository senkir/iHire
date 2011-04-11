class PreviousEmployer < ActiveRecord::Base
  belongs_to :person #fk - person_id
  validates_presence_of :employer, :start_date, :end_date
end