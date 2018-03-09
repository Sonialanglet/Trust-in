class GroupsController < ApplicationController
  def index
    policy_scope(Group)
    if params[:query].present?
      sql_query = " \
           groups.title ILIKE :query \

         "
         @groups = Group.where(sql_query, query: "%#{params[:query]}%")

    else
    @groups = Group.all
    @group = Group.new
  end
  end

  def show
    @group = Group.find(params[:id])
    authorize @group

  end

  def new
    @group = Group.new
    authorize @group
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user
    authorize @group
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def add
    @group_of_selected_user = Group.find(params[:id])

    @selected_user = @group_of_selected_user.founder

    @group = current_user.groups.first
        @group.users << @selected_user unless @group.users.include? @selected_user
        authorize @group
    redirect_to groups_path
  end

  def remove_user

  end


  def join
  end

  def edit
  end

  private

  def group_params
    params.require(:group).permit(:title)
  end

end
