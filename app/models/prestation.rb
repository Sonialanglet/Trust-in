class Prestation < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :groups
end
