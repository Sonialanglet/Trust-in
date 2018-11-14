class AddTitleToPrestations < ActiveRecord::Migration[5.1]
  def change
    add_column :prestations, :title, :string
  end
end
