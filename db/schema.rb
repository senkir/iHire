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

ActiveRecord::Schema.define(:version => 20110411012833) do

  create_table "addresses", :primary_key => "pk", :force => true do |t|
    t.string "street", :limit => 50
    t.string "city",   :limit => 50
    t.string "state",  :limit => 50
    t.string "zip",    :limit => 50
    t.string "phone",  :limit => 50
  end

  create_table "answers", :force => true do |t|
    t.string "name"
    t.string "answer"
    t.date   "created_on"
  end

  create_table "application_states", :force => true do |t|
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attended_schools", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "generalAnswers", :id => false, :force => true do |t|
    t.string "answer", :limit => 1000
  end

  create_table "general_questions", :force => true do |t|
    t.string   "question"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.boolean  "is_applicant"
    t.boolean  "is_employee"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "position_specific_answers", :force => true do |t|
    t.string   "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "position_specific_questions", :force => true do |t|
    t.string   "question"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "positions", :force => true do |t|
    t.string  "title"
    t.string  "description"
    t.string  "department"
    t.string  "location"
    t.boolean "is_open"
    t.date    "created_on"
    t.date    "updated_on"
  end

  create_table "previousEmployers", :primary_key => "pk", :force => true do |t|
    t.string  "employer"
    t.string  "supervisor"
    t.string  "position"
    t.string  "reasonForLeaving"
    t.string  "responsibilities"
    t.date    "startDate"
    t.date    "endDate"
    t.decimal "beginningSalary",  :precision => 10, :scale => 2
    t.decimal "endingSalary",     :precision => 10, :scale => 2
  end

  create_table "questions", :force => true do |t|
    t.string "question"
    t.date   "created_on"
    t.date   "modified_on"
  end

  create_table "schools", :primary_key => "pk", :force => true do |t|
    t.string "name", :limit => 50
  end

end
