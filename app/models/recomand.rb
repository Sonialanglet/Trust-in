class Recomand < ApplicationRecord
  belongs_to :prestation
  belongs_to :user
  validates :user_id, :uniqueness => { :scope => :prestation_id,
    :message => "Users may only write one review per product." }
end
