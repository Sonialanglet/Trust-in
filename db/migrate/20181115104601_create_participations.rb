class CreateParticipations < ActiveRecord::Migration[5.1]
  def change
    create_table :participations do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :status
      t.references :event, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
