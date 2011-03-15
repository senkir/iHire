class CreateGeneralAnswers < ActiveRecord::Migration
  def self.up
    create_table :generalAnswers, :id => false, :force => true do |t|
      t.string :answer, :limit => 1000
    end
  end
  def self.down
    drop table :generalAnswers
  end
end