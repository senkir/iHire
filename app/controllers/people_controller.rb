class PeopleController < ApplicationController
  # GET /persons
  # GET /persons.xml
  def index
    @applicant = Person.find( params[:applicant] )
    @people = Person.all    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @q }
    end
  end

  # GET /answers/1
  # GET /answers/1.xml
  def show
    @person = Person.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @person }
    end
  end

  # GET /PEOPLE/new
  # GET /PEOPLE/new.xml
  def new
    @person = Person.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @answer }
    end
  end

  # GET /people/1/edit
  def edit
    @person = Person.find(params[:applicant])
  end

  # POST /people
  # POST /people.xml
  def create
    @person = Person.new(params[:person])

    respond_to do |format|
      if @answer.save
        flash[:notice] = 'Answers were successfully saved.'
        format.html { redirect_to(@person) }
        format.xml  { render :xml => @person, :status => :created, :location => @person }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @person.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /people/1
  # PUT /people/1.xml
  def update
    @person = Person.find(params[:id])

    respond_to do |format|
      if @person.update_attributes(params[:person])
        flash[:notice] = 'person was successfully updated.'
        format.html { redirect_to(@person) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @person.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.xml
  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    respond_to do |format|
      format.html { redirect_to(people_url) }
      format.xml  { head :ok }
    end
  end
end
