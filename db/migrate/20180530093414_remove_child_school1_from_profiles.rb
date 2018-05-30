class RemoveChildSchool1FromProfiles < ActiveRecord::Migration[5.1]
  def change
    remove_column :profiles, :child_school1, :string
  end
end
