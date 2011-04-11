class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.integer :person_id
      t.integer :school_id
      t.integer :previous_employer_id
    end
  end
  def self.down
    drop_table :addresses
  end
end
