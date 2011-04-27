class GeneralAnswersController < ApplicationController
  include GeneralAnswersHelper
  
  def index
    @applicant = Person.find(params[:applicant])
    @page_title = "Application General Questions"
    build_all_answers @applicant
    @questions = GeneralQuestion.all
    @answers = @applicant.general_answers.all
    
    respond_to do |format|
      format.html #index.html.erb
      format.xml { render :xml => @answer }
    end
  end

  def show
    @applicant = Person.find(params[:id])
    @questions = GeneralQuestion.all
    @answers = @applicant.general_answers.all
  end

  def create
    @answers = params[:general_answer]
    @answers.each do |answer|
      answer.save
    end
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
  

  # PUT /people/1
  # PUT /people/1.xml
  def update
    @applicant = Person.find(params[:id])

    respond_to do |format|
      if @applicant.update_attributes(params[:person])
        flash[:notice] = 'person was successfully updated.'
        format.html { redirect_to general_answer_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @general_answer.errors, :status => :unprocessable_entity }
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

