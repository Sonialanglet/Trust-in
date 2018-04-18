class Profile < ApplicationRecord
  geocoded_by :adress
  belongs_to :user
  after_validation :geocode, if: :will_save_change_to_adress?
end
