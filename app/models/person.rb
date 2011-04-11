class Person < ActiveRecord::Base
  has_many :previous_employer, :answer
  has_one :application_state
  
  validates_presence_of :first_name, :last_name #at least these
end