class Participation < ApplicationRecord

  belongs_to :user
  validates :quantity, presence: true
end
