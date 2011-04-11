class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.boolean :is_applicant
      t.boolean :is_employee
      t.string :first_name
      t.string :middle_name
      t.string :last_name

      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
