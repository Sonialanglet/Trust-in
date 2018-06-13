class AddSchoolChildToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_reference :profiles, :school_child, foreign_key: true
  end
end
