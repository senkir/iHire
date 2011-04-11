class CreateAttendedSchools < ActiveRecord::Migration
  def self.up
    create_table :attended_schools do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :attended_schools
  end
end
