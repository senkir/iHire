class GeneralQuestionsController < ApplicationController
    
  # GET /general_questions
  # GET /general_questions.xml
  def index
    
    
    @general_questions = GeneralQuestion.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @general_questions }
    end
  end

  # GET /general_questions/1
  # GET /general_questions/1.xml
  def show
    @general_question = GeneralQuestion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @general_question }
    end
  end

  # GET /general_questions/new
  # GET /general_questions/new.xml
  def new
    @general_question = GeneralQuestion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @general_question }
    end
  end

  # GET /general_questions/1/edit
  def edit
    @general_question = GeneralQuestion.find(params[:id])
  end

  # POST /general_questions
  # POST /general_questions.xml
  def create
    @general_question = GeneralQuestion.new(params[:general_question])

    respond_to do |format|
      if @general_question.save
        format.html { redirect_to(@general_question, :notice => 'General question was successfully created.') }
        format.xml  { render :xml => @general_question, :status => :created, :location => @general_question }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @general_question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /general_questions/1
  # PUT /general_questions/1.xml
  def update
    @general_question = GeneralQuestion.find(params[:id])

    respond_to do |format|
      if @general_question.update_attributes(params[:general_question])
        format.html { redirect_to(@general_question, :notice => 'General question was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @general_question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /general_questions/1
  # DELETE /general_questions/1.xml
  def destroy
    @general_question = GeneralQuestion.find(params[:id])
    @general_question.destroy

    respond_to do |format|
      format.html { redirect_to(general_questions_url) }
      format.xml  { head :ok }
    end
  end
end
