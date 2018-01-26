class AddCategoryToPrestations < ActiveRecord::Migration[5.1]
  def change
    add_reference :prestations, :category, foreign_key: true
  end
end
