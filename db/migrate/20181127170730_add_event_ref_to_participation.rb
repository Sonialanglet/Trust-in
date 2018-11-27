class AddEventRefToParticipation < ActiveRecord::Migration[5.1]
  def change
    add_column :participations, :event_ref, :string
  end
end
