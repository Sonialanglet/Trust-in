class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :profiles, :club1, :formation1
    rename_column :profiles, :club2, :formation2
  end
end
