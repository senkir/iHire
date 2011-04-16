class CreateGeneralQuestions < ActiveRecord::Migration
  def self.up
    create_table :general_questions do |t|
      t.string :question
      t.string :quesiton_type
      t.timestamps
    end
  end

  def self.down
    drop_table :general_questions
  end
end
