class CreateFavoriteConvoys < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_convoys do |t|
      t.integer :user_id
      t.integer :convoy_id

      t.timestamps
    end
  end
end
