class RemoveSchool2FromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :school2, :string
  end
end
