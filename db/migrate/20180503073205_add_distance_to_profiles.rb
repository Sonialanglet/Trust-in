class AddDistanceToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :distance, :float
  end
end
