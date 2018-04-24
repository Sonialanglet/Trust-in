class ChangeAdressToBeStringInProfiles < ActiveRecord::Migration[5.1]
  def change
    change_column :profiles, :adress, :string
  end
end
