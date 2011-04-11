class Person < ActiveRecord::Base
  has_many :previous_employers
  has_many :answers
  has_one :address
  belongs_to :application_state #fk - application_state_id
  
  validates_presence_of :first_name, :last_name #at least these are required
end