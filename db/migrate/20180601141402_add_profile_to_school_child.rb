class AddProfileToSchoolChild < ActiveRecord::Migration[5.1]
  def change
    add_reference :school_children, :profile, foreign_key: true
  end
end
