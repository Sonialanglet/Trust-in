class AddAvailablePlacesToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :available_places, :integer
  end
end
