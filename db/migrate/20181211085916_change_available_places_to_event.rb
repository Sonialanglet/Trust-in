class ChangeAvailablePlacesToEvent < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :available_places, :integer
    add_column :participations, :available_places, :integer
  end
end
