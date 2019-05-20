class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :country, :string
    add_column :users, :phone_number, :string
    add_column :users, :active, :boolean, default: true
    add_column :users, :age, :integer
    add_column :users, :name, :string
  end
end
