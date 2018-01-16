class ChangeColumnNameToGroups < ActiveRecord::Migration[5.1]
  def change
    rename_column :groups, :user_id, :founder_id
  end
end
