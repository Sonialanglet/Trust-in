class AddPhoto1AndPhoto2AndPhoto3ToPrestation < ActiveRecord::Migration[5.1]
  def change
    add_column :prestations, :photo1, :string
    add_column :prestations, :photoN2, :string
    add_column :prestations, :photoN3, :string
  end
end
