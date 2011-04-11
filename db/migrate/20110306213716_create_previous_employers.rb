class CreatePreviousEmployers < ActiveRecord::Migration
  def self.up 
    create_table :previous_employers do |t|
      t.string  :employer
      t.string  :supervisor
      t.string  :position
      t.string  :reason_for_leaving
      t.string  :responsibilities
      t.date    :start_date
      t.date    :end_date
      t.decimal :beginning_salary, :precision => 10, :scale => 2
      t.decimal :ending_salary,    :precision => 10, :scale => 2
    end
  end
  def self.down
    drop_table :previous_employers
  end
end
