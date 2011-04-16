class GeneralQuestionsController < ApplicationController
  include GeneralQuestionsHelper
  
  def index
    @applicant = Person.find(params[:applicant])
    @page_title = "Application General Questions"
    build_all_answers @applicant
    @questions = GeneralQuestion.all
    
    respond_to do |format|
      format.html #index.html.erb
      format.xml { render :xml => @answer }
    end
  end

  def results
    @question = GeneralQuestion.find(1)
    @answer = GeneralAnswer.find(params[:id])
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

=begin
  Saved in case i need it later:

    <% if @answer.errors.any? %>
    <div id="error_explanation">
      <h2><%= pluralize(@answer.errors.count, "error") %> prohibited this answer from being saved:</h2>

      <ul>
      <% @answer.errors.full_messages.each do |msg| %>
        <li><%= msg %></li>
      <% end %>
      </ul>
    </div>
  <% end %>
=end