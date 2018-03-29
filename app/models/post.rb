class Post < ApplicationRecord

  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :replies, dependent: :destroy
end
