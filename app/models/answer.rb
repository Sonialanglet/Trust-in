class Answer < ApplicationRecord
  belongs_to :booking
  belongs_to :user
end
