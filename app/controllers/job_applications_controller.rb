#this controller should manage the initialization of a new applicant
#including direcing them to the proper controller as needed
class JobApplicationsController < ApplicationController  
  include AASM
  include JobApplicationsHelper
  def index
      
      if !params[:position]
        redirect_to positions_search_path        
      end
      if params[:state]
        @application_state = ApplicationState.find(params[:state])
      else
              
      #the application process is starting, so do some intial setup to get things going.
      @applicant = Person.new
      @applicant.save
#     @applicant.application_state = @application_state
      @applicant.build_application_state
       @applicant.position = Position.find(params[:position])
      end
      @page_title = name_for_state(@applicant.application_state)      
    end
    
    #transition to the next state
    def next
      @applicant = Person.find(params[:applicant])
      @application_state = ApplicationState.application_state      
      @application_state.next
      @application_state.save
      #redirect based on state
      #for now this redirects to index page
      if @application_state.general_questions?
        redirect_to general_questions_path( :applicant => params[:applicant])
      end
      if @application_state.position_specific_questions?
        redirect_to position_specific_questions-path, {:applicant => params[:applicant]} 
      end
      
      redirect_to(:action => "index", :state => params[:state] )
    end
end