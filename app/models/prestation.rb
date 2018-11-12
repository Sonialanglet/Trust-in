class Prestation < ApplicationRecord
  mount_uploader :photo1, PhotoUploader
  mount_uploader :photoN2, PhotoUploader
  mount_uploader :photoN3, PhotoUploader
  belongs_to :user

  belongs_to :category
  validates_uniqueness_of :category_id, :scope => :user_id, :message => "Vous avez déjà créé une proposition pour cette catégorie. RDV dans la section Profile du menu déroulant en haut à droite si vous souhaitez la modifier"

  has_many :groups
  has_many :reviews, dependent: :destroy
  has_many :recomands, dependent: :destroy
  has_many :bookings,dependent: :destroy

end
