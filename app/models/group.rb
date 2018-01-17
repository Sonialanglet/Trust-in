class Group < ApplicationRecord
  belongs_to :user, optional: true
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users
  has_many :group_prestations, dependent: :destroy
  has_many :prestations, through: :group_prestations

end
