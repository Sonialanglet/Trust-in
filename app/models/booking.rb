class Booking < ApplicationRecord
  belongs_to :prestation
  belongs_to :user
end
