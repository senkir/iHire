class CreatePositionSpecificAnswers < ActiveRecord::Migration
  def self.up
    create_table :position_specific_answers do |t|
      t.string :answer

      t.timestamps
    end
  end

  def self.down
    drop_table :position_specific_answers
  end
end
