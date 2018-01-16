class GroupPrestation < ApplicationRecord
  belongs_to :prestation
  belongs_to :group
end
