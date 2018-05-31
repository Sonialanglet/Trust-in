class SchoolChildrenController < ApplicationController


  def index
    policy_scope(SchoolChild)
    if params[:query].present?
       sql_query = "name ILIKE :query OR locality ILIKE :query"
        @school_children = SchoolChild..order(:name).where(sql_query, query: "%#{params[:query]}%")
        respond_to do |format|
            format.html  # index.html.erb
            format.json  { render :json => @school_children.map(&:name) }
          end
       else
    @school_children = SchoolChild.all
    end
  end

  def show
    @school_child = SchoolChild.find(params[:id])
    authorize @school_child

  end

end
