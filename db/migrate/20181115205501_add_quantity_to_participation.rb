class AddQuantityToParticipation < ActiveRecord::Migration[5.1]
  def change
    add_column :participations, :quantity, :integer
  end
end
