#this controller should manage the initialization of a new applicant
#including direcing them to the proper controller as needed
class JobApplicationsController < ApplicationController  
  include AASM
  include JobApplicationsHelper
  
  def index
    @page_title = "General Questions"
    if !params[:position]
      redirect_to positions_search_path        
    end
    if params[:state]
      @application_state = ApplicationState.find(params[:state])
    else
              
    #the application process is starting, so do some intial setup to get things going.
      @applicant = Person.new
      @applicant.save
    #@applicant.application_state = @application_state
     @applicant.build_application_state
     @applicant.position = Position.find(params[:position])
     @applicant.save

    end
    @page_title = name_for_state(@applicant.application_state)      
  end
    
    #transition to the next state
  def next
      @applicant = Person.find(params[:applicant])
      @state = @applicant.application_state
      @state.next
      @state.save
      #redirect based on state
      #for now this redirects to index page
      if @state.application_complete?
        redirect_to job_applications_complete_path(:applicant => params[:applicant])
      else
        if @state.general_questions?
          redirect_to general_answers_path( :applicant => params[:applicant])
        end
        if @state.position_specific_questions?
          redirect_to position_specific_answers_path(:applicant => params[:applicant]) 
        end
        if @state.personal_information?
          redirect_to edit_person_path(params[:applicant])
        end
        if @state.in_review?
          redirect_to person_path(params[:applicant])
        end
      end
  end
  
  def complete
    @applicant = Person.find(params[:applicant])
    @state = @applicant.application_state
    if ! @state.application_complete?
      redirect_to 'next'
    end
    @state.close
    @state.save
    @applicant = Person.find(params[:applicant])
  end
  
end