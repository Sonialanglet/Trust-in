class ChangeAdressToBeTextInProfiles < ActiveRecord::Migration[5.1]
  def change
    change_column :profiles, :adress, :text
  end
end
