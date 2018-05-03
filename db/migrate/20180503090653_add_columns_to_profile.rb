class AddColumnsToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :street_number, :string
    add_column :profiles, :route, :string
    add_column :profiles, :locality, :string
    add_column :profiles, :country, :string
  end
end
