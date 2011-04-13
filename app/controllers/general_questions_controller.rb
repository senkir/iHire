class JGeneralQuestionsController < ApplicationController
  def index
    @applicant = Person.find(params[:applicant])
    @title = "Application General Questions"
    @question = Question.find(1) 
    @answer = Answer.new    
    
    respond_to do |format|
      format.html #index.html.erb
      format.xml { render :xml => @answer }
    end
  end

  def results
    @question = Question.find(1)
    @answer = Answer.find(params[:id])
  end

  def create
    @answer = Answer.new(params[:answer])
    @question = Question.find(1)
    respond_to do |format|
      if @answer.save
        format.html { redirect_to(:action => "results", :id => @answer.id, :notice => 'General question was successfully created.') }
        format.xml  { render :xml => @answer, :status => :created, :location => @answer }
      else
        format.html { render :action => "index" }
        #format.html { redirect_to(:action => "index" )}
        format.xml  { render :xml => @answer.errors, :status => :unprocessable_entity }
      end
    end
  end
  
end
