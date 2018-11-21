class ChangePriceToEvents < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :price, :string
    add_monetize :events, :price, currency: { present: false }
  end
end
