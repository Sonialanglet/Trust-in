class AddChildSchoolToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :child_school, :string
  end
end
