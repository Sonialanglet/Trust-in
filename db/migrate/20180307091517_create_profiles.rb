class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.text :description
      t.string :town
      t.string :adress
      t.string :school1
      t.string :school2
      t.string :club1
      t.string :club2
      t.references :user, foreign_key: true
      t.date :date_of_birth

      t.timestamps
    end
  end
end
