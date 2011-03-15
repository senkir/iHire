class Position < ActiveRecord::Base
    default_scope order('updated_on')
  
  #validation stuff comes after
  validates :title, :department, :description, :location, :presence => true
end
