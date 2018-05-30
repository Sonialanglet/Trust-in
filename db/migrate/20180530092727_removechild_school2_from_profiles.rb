class RemovechildSchool2FromProfiles < ActiveRecord::Migration[5.1]
  def change
    remove_column :profiles, :child_school2, :string
  end
end
