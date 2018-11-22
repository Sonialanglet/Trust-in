class RemoveEventToParticipation < ActiveRecord::Migration[5.1]
  def change
    remove_reference :participations, :event, foreign_key: true
  end
end
