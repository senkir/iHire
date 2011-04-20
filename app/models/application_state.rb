class ApplicationState < ActiveRecord::Base
    include AASM    
    has_one :person
  
    aasm_column :state
    aasm_initial_state :new_applicant
    
    aasm_state :new_applicant
    aasm_state :general_questions
    aasm_state :position_specific_questions
    aasm_state :personal_information
    aasm_state :in_review
    aasm_state :application_rejected
    aasm_state :application_complete
    
    aasm_event :next do
      transitions :to => :general_questions, :from => [:new_applicant]
      transitions :to => :position_specific_questions, :from => [:general_questions]
      transitions :to => :personal_information, :from => [:position_specific_questions]
      transitions :to => :in_review, :from => [:personal_information]
    end
    
    aasm_event :edit_information do
      transitions :to => :personal_information, :from => [:in_review]
    end
  
    aasm_event :close do 
      transitions :to => :application_complete, :from => [:in_review]
    end
    
    aasm_event :reject do
      transitions :to => :application_rejected, :from => [:new_applicant, :general_questions, :position_specific_questions]
    end
end
