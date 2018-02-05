class Review < ApplicationRecord
  belongs_to :prestation
  has_one :user
end
