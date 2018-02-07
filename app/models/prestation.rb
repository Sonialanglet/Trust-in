class Prestation < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :groups
  has_many :reviews, dependent: :destroy
  has_many :recomands, dependent: :destroy

end
