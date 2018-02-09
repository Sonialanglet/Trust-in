class Group < ApplicationRecord
  belongs_to :founder, class_name: 'User', foreign_key: 'founder_id'
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users



end
