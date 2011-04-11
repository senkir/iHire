module JobApplicationsHelper
  
  #return a string representing the current state of the argument
  def name_for_state state
    if state.new_applicant?
      @name = "New Applicant"
    end
    if state.general_questions?
      @name = "General Questions"
    end
    if state.job_specific_questions?
      @name = "Job Specific Questions"
    end
    if state.personal_information?
      @name = "Personal Information"
    end
    if state.in_review?
      @name = "In Review"
    end
    if state.application_complete?
      @name = "Application Complete"
    end
    @name #returns result
  end
end