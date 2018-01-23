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
    @group = Group.new(prestation_params)
    @group.user = current_user
    authorize @group
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def join
  end

  def edit
  end

  private

  def prestation_params
    params.require(:group).permit(:title)
  end

end
