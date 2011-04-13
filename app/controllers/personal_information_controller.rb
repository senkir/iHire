class PersonalInformationController < ApplicationController
  def index
    @applicant = Person.find(params[:applicant])
  end
end