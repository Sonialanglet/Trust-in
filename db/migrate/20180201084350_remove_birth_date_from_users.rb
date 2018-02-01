class RemoveBirthDateFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :birth_date, :string
  end
end
