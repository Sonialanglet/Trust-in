class RemoveSchoolChildFromProfile < ActiveRecord::Migration[5.1]
  def change
    remove_reference :profiles, :school_child, foreign_key: true
  end
end
