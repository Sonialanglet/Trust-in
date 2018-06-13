class CreateSchoolChildren < ActiveRecord::Migration[5.1]
  def change
    create_table :school_children do |t|
      t.string :name
      t.string :adress
      t.string :CP
      t.string :locality

      t.timestamps
    end
  end
end
