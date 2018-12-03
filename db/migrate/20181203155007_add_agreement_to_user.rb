class AddAgreementToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :agreement, :boolean,  default: true
  end
end
