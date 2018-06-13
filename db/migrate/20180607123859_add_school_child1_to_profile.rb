class AddSchoolChild1ToProfile < ActiveRecord::Migration[5.1]
  def change
    add_reference :profiles, :school_child, foreign_key: true
    remove_column :profiles, :child_school, :string
  end
end
