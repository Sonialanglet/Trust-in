class CreateGroupPrestations < ActiveRecord::Migration[5.1]
  def change
    create_table :group_prestations do |t|
      t.references :prestation, foreign_key: true
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
