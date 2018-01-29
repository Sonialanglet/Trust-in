class AddColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :description, :text
    add_column :users, :town, :string
    add_column :users, :address, :string
    add_column :users, :school1, :string
    add_column :users, :school2, :string
    add_column :users, :club1, :string
    add_column :users, :club2, :string
    add_column :users, :birth_date, :string
  end
end
