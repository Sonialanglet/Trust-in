class CreateReplies < ActiveRecord::Migration[5.1]
  def change
    create_table :replies do |t|
      t.text :content
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
