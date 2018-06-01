class RemoveUserFromScoolChild < ActiveRecord::Migration[5.1]
  def change
    remove_reference :school_children, :user, foreign_key: true
  end
end
