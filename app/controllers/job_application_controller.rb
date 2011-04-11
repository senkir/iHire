class JobApplicationController < ApplicationController
  include AASM    
    aasm_initial_state :new_applicant
    
    aasm_state :new_applicant
    aasm_state :general_questions
    aasm_state :job_specific_questions
    aasm_state :personal_information
    aasm_state :application_rejected
    aasm_state :application_complete
    
    aasm_event :next_section do
      transitions :to => :general_questions, :from => [:new_applicant]
      transitions :to => :job_specific_questions, :from => [:general_questions]
      transitions :to => :personal_information, :from => [:job_specific_questions]
    end
    
    aasm_event :close do 
      transitions :to => :application_complete, :from => [:personal_information]
    end
  
    def index
      @aasm_state = aasm_initial_state
    end
end