class Address < ActiveRecord::Base
  default_scope order('updated_on')
  
  #validation stuff comes after
  validates_presence_of :street, :city, :state, :zip, :phone

end