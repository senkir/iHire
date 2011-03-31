class CreatePositions < ActiveRecord::Migration
  def self.up
    create_table :positions do |t|
      t.string :title
      t.string :description
      t.string :department
      t.string :location
      t.boolean :is_open
      t.date :created_on
      t.date :updated_on
    end
  end

  def self.down
    drop_table :positions
  end
end
