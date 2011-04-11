#this controller should manage the initialization of a new applicant
#including direcing them to the proper controller as needed
class JobApplicationsController < ApplicationController  
  include AASM
  include JobApplicationsHelper
    def index #default controller
      if params[:state]
        @application_state = ApplicationState.find(params[:state])
      else
      @application_state = ApplicationState.new
      @application_state.save
      end
      @page_title = name_for_state(@application_state)
    end
    
    #transition to the next state
    def next
      @application_state = ApplicationState.find(params[:state])      
      @application_state.next
      @application_state.save
      #redirect based on state
      #for now this redirects to index page
      redirect_to(:action => "index", :state => params[:state] )
    end
end