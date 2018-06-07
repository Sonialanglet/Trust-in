class AddColumnsToSchoolChildren < ActiveRecord::Migration[5.1]
  def change
    add_column :school_children, :latitude, :float
    add_column :school_children, :longitude, :float

  end
end
