class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.integer :user_id
      t.integer :convoy_id
      t.boolean :confirmed, default: false

      t.timestamps
    end
  end
end
