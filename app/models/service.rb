class Service < ApplicationRecord
  has_many :prestation_services
  has_many :prestations, through: :prestation_services
end
