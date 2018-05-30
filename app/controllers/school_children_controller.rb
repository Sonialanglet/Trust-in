class SchoolChildrenController < ApplicationController
  def index
    policy_scope(SchoolChild)
    @school_children = SchoolChild.all
  end
end
