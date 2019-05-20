class CreateConvoys < ActiveRecord::Migration[5.2]
  def change
    create_table :convoys do |t|
      t.integer :user_id
      t.integer :to_location_id
      t.integer :from_location_id
      t.string :name
      t.datetime :start_date
      t.datetime :finish_date
      t.boolean :fwd_only, default: false
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
