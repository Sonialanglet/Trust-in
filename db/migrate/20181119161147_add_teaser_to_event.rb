class AddTeaserToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :teaser, :string
  end
end
