class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.boolean :is_applicant, :default => '1'
      t.boolean :is_employee, :default => '0'
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.integer :position_id
      t.integer :application_state_id

      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
