class AddAmountAndPaymentToParticipation < ActiveRecord::Migration[5.1]
  def change
    add_column :participations, :payment, :jsonb
    add_monetize :participations, :amount, currency: { present: false }

  end
end
