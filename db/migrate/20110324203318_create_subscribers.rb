class CreateSubscribers < ActiveRecord::Migration
  def self.up
    create_table :subscribers do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :interest
      t.string :status
      t.string :work_field

      t.timestamps
    end
  end

  def self.down
    drop_table :subscribers
  end
end
