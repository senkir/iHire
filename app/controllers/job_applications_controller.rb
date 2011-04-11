class JobApplicationsController < ApplicationController  
  include AASM
  include JobApplicationsHelper
    def index
      if params[:id]
        @application_state = ApplicationState.find(params[:id])
      else
      @application_state = ApplicationState.new
      @application_state.save
      end
      @page_title = name_for_state(@application_state)
    end
    
    #transition to the next state
    def next
      @application_state = ApplicationState.find(params[:id])      
      @application_state.next
      @application_state.save
      redirect_to(:action => "index", :id => params[:id] )
    end
end