class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.string :question
      t.date :created_on
      t.date :modified_on
    end
  end

  def self.down
    drop_table :questions
  end
end
