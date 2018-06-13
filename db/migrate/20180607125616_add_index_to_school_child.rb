class AddIndexToSchoolChild < ActiveRecord::Migration[5.1]
  def change
    add_index :school_children, :name
  end
end
