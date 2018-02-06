class CreateRecomands < ActiveRecord::Migration[5.1]
  def change
    create_table :recomands do |t|
      t.references :prestation, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
