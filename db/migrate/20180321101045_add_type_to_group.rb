class AddTypeToGroup < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :type, :string
  end
end
