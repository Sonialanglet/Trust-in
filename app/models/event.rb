class Event < ApplicationRecord

  mount_uploader :photo, PhotoUploader
  has_many :participations, dependent: :destroy
end
