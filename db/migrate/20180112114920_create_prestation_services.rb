class CreatePrestationServices < ActiveRecord::Migration[5.1]
  def change
    create_table :prestation_services do |t|
      t.references :prestation, foreign_key: true
      t.references :service, foreign_key: true

      t.timestamps
    end
  end
end
