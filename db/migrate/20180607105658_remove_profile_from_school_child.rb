class RemoveProfileFromSchoolChild < ActiveRecord::Migration[5.1]
  def change
    remove_reference :school_children, :profile, foreign_key: true
  end
end
