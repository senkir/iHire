class JobApplicationsController < ApplicationController  
  include AASM
  
    def index
      if params[:id]
        @application_state = ApplicationState.find(params[:id])
      else
      @application_state = ApplicationState.new
      @application_state.save
      end
    end
    
    #transition to the next state
    def next
      @application_state = ApplicationState.find(params[:id])      
      @application_state.next
      @application_state.save
      redirect_to(:action => "index", :id => params[:id] )
    end
end