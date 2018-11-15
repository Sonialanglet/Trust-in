class AddNumberOfParticipantsToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :number_of_participants, :integer
  end
end
