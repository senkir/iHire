class CreateGeneralAnswers < ActiveRecord::Migration
  def self.up
    create_table :general_answers do |t|
      t.string :answer
    end
  end
  def self.down
    drop table :general_answers
  end
end