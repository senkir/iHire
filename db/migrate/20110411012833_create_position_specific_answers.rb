class CreatePositionSpecificAnswers < ActiveRecord::Migration
  def self.up
    create_table :position_specific_answers do |t|
      t.string :answer
      t.string :person_id, :null => 'false'
      t.string :position_specific_question_id, :null => 'false'

      t.timestamps
    end
  end

  def self.down
    drop_table :position_specific_answers
  end
end
