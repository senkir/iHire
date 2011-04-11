class GeneralQuestionsController < ApplicationController
      
#  show the general questions and allow the apploicant to answer each of them in turn
  def index  
    @applicant = Person.find(params[:applicant])
  end
end
