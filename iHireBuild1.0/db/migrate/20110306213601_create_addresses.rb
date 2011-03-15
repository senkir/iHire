class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses, :primary_key => :pk, :force => true do |t|
      t.string :street, :limit => 50
      t.string :city,   :limit => 50
      t.string :state, :limit => 50
      t.string :zip,    :limit => 50
      t.string :phone,  :limit => 50
    end
  end
  def self.down
    drop_table :addresses
  end
end
