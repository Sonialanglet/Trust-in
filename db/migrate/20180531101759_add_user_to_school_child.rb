class AddUserToSchoolChild < ActiveRecord::Migration[5.1]
  def change
    add_reference :school_children, :user, foreign_key: true
  end
end
