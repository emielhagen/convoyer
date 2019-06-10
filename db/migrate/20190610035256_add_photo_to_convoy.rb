class AddPhotoToConvoy < ActiveRecord::Migration[5.2]
  def change
    add_column :convoys, :photo, :string
  end
end
