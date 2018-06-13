class SchoolChild < ApplicationRecord
  has_many :profiles
 reverse_geocoded_by :latitude, :longitude


end
