class PersonalInformationController < ApplicationController
  
  def results
    @address = Address.find(1)
  end
  
  def get_info
	@address = Address.new
	/respond_to do |format|
	  format.html { redirect_to(:action => "results", :id => @address.id, :notice => 'Address successfully recorded.') }
      format.xml  { render :xml => @address, :status => :created, :location => @address }

	end/
  end
end
