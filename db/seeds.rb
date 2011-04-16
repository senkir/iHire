# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)


#some sample positions
Position.create(:title => 'Associate Wrangler', :description => 'Wrangler of various livestock', :department => 'Livestock', :location =>'The Pig Emporium and TV warehouse', :is_open => '1')
Position.create(:title => 'Head Wrangler', :description => 'Only the most experienced wranglers are entitled to this position', :department => 'Livestock', :location =>'The Pig Emporium and TV warehouse', :is_open => '0')
Position.create(:title => 'Associate Cashier', :description => 'handles customer facing operations and cash handling activities.', :department => 'Front End', :location =>'The Pig Emporium and TV warehouse', :is_open => '1')
Position.create(:title => 'Head Cashier', :description => 'ensures day to day operations are carried out effectively.', :department => 'Front End', :location =>'The Pig Emporium and TV warehouse', :is_open => '1')
Position.create(:title => 'TV Specialist', :description => 'handles customer facing activities related to TV sales and promotions.', :department => 'Electronics', :location =>'The Pig Emporium and TV warehouse', :is_open => '1')

#some initial general questions

#question types are: yes_or_no, , multiple_choice, multi_select, text_box
GeneralQuestion.create(:question => 'Are you over 18?', :question_type => 'yes_or_no')
GeneralQuestion.create(:question => 'Are you eligible to work in the state of Texas?', :question_type => 'yes_or_no')
#some intial job specific questions
#TODO think of some