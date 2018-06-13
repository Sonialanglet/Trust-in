class Profile < ApplicationRecord

  belongs_to :user
  belongs_to :school_child, optional:true



  geocoded_by :adress
  after_validation :geocode, if: :will_save_change_to_adress?

  #def school_child_name
  #  school_child.try(:name)

  #end


  #def school_child_name=(name)
  #  self.school_child = SchoolChild.find_or_create_by(name: name) if name.present?

#  end


end
