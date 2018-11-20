class AddResumeToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :resume, :text
  end
end
