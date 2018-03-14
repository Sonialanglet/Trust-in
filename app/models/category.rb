class Category < ApplicationRecord
  has_many :prestations, dependent: :destroy


end
