class Booking < ApplicationRecord
  belongs_to :prestation
  belongs_to :user
  has_many :answers, dependent: :destroy
end
