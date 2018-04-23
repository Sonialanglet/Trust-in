class AddChildSchool1AndChildSchool2ToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :child_school1, :string
    add_column :profiles, :child_school2, :string
  end
end
