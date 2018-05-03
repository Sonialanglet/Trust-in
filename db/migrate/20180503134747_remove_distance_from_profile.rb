class RemoveDistanceFromProfile < ActiveRecord::Migration[5.1]
  def change
    remove_column :profiles, :distance, :float
  end
end
