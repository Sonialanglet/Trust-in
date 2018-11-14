class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :photo
      t.date :date
      t.string :price

      t.timestamps
    end
  end
end
