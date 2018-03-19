class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.text :description
      t.date :date
      t.string :location
      t.string :status
      t.references :prestation, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
