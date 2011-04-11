class CreatePreviousEmployers < ActiveRecord::Migration
  def self.up 
    create_table :previousEmployers do |t|
      t.string  :employer
      t.string  :supervisor
      t.string  :position
      t.string  :reasonForLeaving
      t.string  :responsibilities
      t.date    :startDate
      t.date    :endDate
      t.decimal :beginningSalary, :precision => 10, :scale => 2
      t.decimal :endingSalary,    :precision => 10, :scale => 2
    end
  end
  def self.down
    drop_table :previousEmployers
  end
end
