class Group < ApplicationRecord
  belongs_to :user
  has_many :users
  has_many :prestations
end
