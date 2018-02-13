class GroupsController < ApplicationController
  def index
    policy_scope(Group)
    @groups = Group.all
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

  def join

      @group = Group.find(params[:id])
      @group.status = 'accepted'
      GroupUser.create(user: current_user, group: @group)
      redirect_to groups_path
  end

  def edit
  end

  private

  def group_params
    params.require(:group).permit(:title)
  end

end
