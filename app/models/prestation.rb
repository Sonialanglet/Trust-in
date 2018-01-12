class Prestation < ApplicationRecord
  belongs_to :user
  has_many :prestation_services
  has_many :services, through: :prestation_services
end
