class Person < ActiveRecord::Base
  has_many :previous_employers
  has_many :answers
  has_one :address
  belongs_to :application_state #fk - application_state_id
  belongs_to :position  #fk - position_id
  #validates_presence_of :first_name, :last_name #at least these are required
  
  after_initialize :default_values

  private
    def default_values
      self.is_applicant ||= "true"
      self.is_employee ||= "false"
    end
end