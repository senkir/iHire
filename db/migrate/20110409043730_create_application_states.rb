class CreateApplicationStates < ActiveRecord::Migration
  def self.up
    create_table :application_states do |t|
      t.string :state
      t.timestamps
    end
  end

  def self.down
    drop_table :application_states
  end
end
