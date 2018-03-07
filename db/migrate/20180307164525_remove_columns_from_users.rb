class RemoveColumnsFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :description, :text
    remove_column :users, :town, :string
    remove_column :users, :school1, :string
    remove_column :users, :address, :string
    remove_column :users, :club1, :string
    remove_column :users, :club2, :string
    remove_column :users, :date_of_birth, :date
  end
end
