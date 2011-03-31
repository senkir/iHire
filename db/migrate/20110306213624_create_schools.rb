class CreateSchools < ActiveRecord::Migration
  def self.up
    create_table :schools, :primary_key => :pk, :force => true do |t|
      t.string :name , :limit => 50
    end
  end
  def self.down
    drop_table :schools
  end
end
