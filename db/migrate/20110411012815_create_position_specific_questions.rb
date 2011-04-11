class CreatePositionSpecificQuestions < ActiveRecord::Migration
  def self.up
    create_table :position_specific_questions do |t|
      t.string :question
      t.string :position_id, :null => 'false'

      t.timestamps
    end
  end

  def self.down
    drop_table :position_specific_questions
  end
end
