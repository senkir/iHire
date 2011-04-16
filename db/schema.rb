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

  create_table "addresses", :force => true do |t|
    t.string  "street"
    t.string  "city"
    t.string  "state"
    t.string  "zip"
    t.string  "phone"
    t.integer "person_id"
    t.integer "school_id"
    t.integer "previous_employer_id"
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

  create_table "general_answers", :force => true do |t|
    t.string  "answer"
    t.integer "person_id"
    t.integer "general_question_id"
  end

  create_table "general_questions", :force => true do |t|
    t.string   "question"
    t.string   "question_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.boolean  "is_applicant",         :default => true
    t.boolean  "is_employee",          :default => false
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.integer  "position_id"
    t.integer  "application_state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "position_specific_answers", :force => true do |t|
    t.string   "answer"
    t.string   "person_id"
    t.string   "position_specific_question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "position_specific_questions", :force => true do |t|
    t.string   "question"
    t.string   "position_id"
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

  create_table "previous_employers", :force => true do |t|
    t.string  "employer"
    t.string  "supervisor"
    t.string  "position"
    t.string  "reason_for_leaving"
    t.string  "responsibilities"
    t.date    "start_date"
    t.date    "end_date"
    t.decimal "beginning_salary",   :precision => 10, :scale => 2
    t.decimal "ending_salary",      :precision => 10, :scale => 2
    t.integer "person_id"
  end

  create_table "schools", :force => true do |t|
    t.string "name"
    t.string "limit"
  end

end
