class CreateGeneralAnswers < ActiveRecord::Migration
  def self.up
    create_table :general_answers do |t|
      t.string :answer
      t.integer :person_id, :null => 'false'
      t.integer :general_question_id, :null => 'false'
    end
  end
  def self.down
    drop table :general_answers
  end
end