# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 0) do

  create_table "addresses", :primary_key => "ID", :force => true do |t|
    t.string "street", :limit => 50
    t.string "city",   :limit => 50
    t.string "state_", :limit => 50
    t.string "zip",    :limit => 50
    t.string "phone",  :limit => 50
  end

  create_table "attendedSchools", :primary_key => "ID", :force => true do |t|
    t.string  "name",       :limit => 50
    t.integer "fk_address", :limit => 2
  end

  add_index "attendedSchools", ["fk_address"], :name => "fk_address"

  create_table "generalAnswers", :id => false, :force => true do |t|
    t.string  "answer",      :limit => 500
    t.integer "fk_person",   :limit => 2,   :null => false
    t.integer "fk_question", :limit => 2,   :null => false
  end

  add_index "generalAnswers", ["fk_question"], :name => "fk_question"

  create_table "hasApplication", :id => false, :force => true do |t|
    t.integer "fk_person",   :limit => 2, :null => false
    t.integer "fk_position", :limit => 2, :null => false
  end

  add_index "hasApplication", ["fk_position"], :name => "fk_position"

  create_table "hasAttendedSchools", :id => false, :force => true do |t|
    t.integer "fk_attendedSchool", :limit => 2, :null => false
    t.integer "fk_person",         :limit => 2, :null => false
  end

  add_index "hasAttendedSchools", ["fk_person"], :name => "fk_person"

  create_table "hasPrevEmployer", :id => false, :force => true do |t|
    t.integer "fk_prevEmployer", :limit => 2, :null => false
    t.integer "fk_person",       :limit => 2, :null => false
  end

  add_index "hasPrevEmployer", ["fk_person"], :name => "fk_person"

  create_table "people", :primary_key => "ID", :force => true do |t|
    t.binary  "isApplicant", :limit => 1
    t.binary  "isEmployee",  :limit => 1
    t.string  "fName",       :limit => 50
    t.string  "mName",       :limit => 50
    t.string  "lName",       :limit => 50
    t.integer "fk_address",  :limit => 2
  end

  add_index "people", ["fk_address"], :name => "fk_address"

  create_table "positionSpecificAnswers", :id => false, :force => true do |t|
    t.string  "answer",      :limit => 500
    t.integer "fk_person",   :limit => 2,   :null => false
    t.integer "fk_question", :limit => 2,   :null => false
    t.integer "fk_position", :limit => 2,   :null => false
  end

  add_index "positionSpecificAnswers", ["fk_position"], :name => "fk_position"
  add_index "positionSpecificAnswers", ["fk_question"], :name => "fk_question"

  create_table "positions", :primary_key => "ID", :force => true do |t|
    t.string "title",       :limit => 50
    t.string "description", :limit => 500
  end

  create_table "prevEmployers", :primary_key => "ID", :force => true do |t|
    t.string  "employer",    :limit => 50
    t.string  "supervisor",  :limit => 50
    t.string  "position",    :limit => 50
    t.string  "leaveReason", :limit => 500
    t.string  "resp",        :limit => 500
    t.date    "startDate"
    t.date    "endDate"
    t.decimal "startSalery",                :precision => 10, :scale => 2
    t.decimal "endSalery",                  :precision => 10, :scale => 2
    t.integer "fk_address",  :limit => 2
  end

  add_index "prevEmployers", ["fk_address"], :name => "fk_address"

  create_table "questions", :primary_key => "ID", :force => true do |t|
    t.string "question", :limit => 500
  end

end
