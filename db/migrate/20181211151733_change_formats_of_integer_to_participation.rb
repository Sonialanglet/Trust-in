class ChangeFormatsOfIntegerToParticipation < ActiveRecord::Migration[5.1]
  def change
    change_column :participations, :quantity, :integer, { null: false , default: 0 }

  end
end
