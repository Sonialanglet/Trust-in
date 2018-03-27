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

  def add_user_to_principal
    #@group_of_selected_user = Group.find(params[:id])

    #@selected_user = @group_of_selected_user.founder
    @selected_user = User.find(params[:user_id])

    @group = current_user.groups.find do |group|
      group.category == 'principal'
    end

    unless @group.users.include? @selected_user
      group_user = GroupUser.new(group: @group, user: @selected_user, status: 'accepted')
      group_user.save
    end
    authorize @group
    redirect_to groups_path
  end

  def remove_user_from_principal
   @group = current_user.groups.find do |group|
     group.category == 'principal'
   end

    @selected_user = User.find(params[:user_id])
    group_users = GroupUser.where(group: @group, user: @selected_user)
    group_users.each do |group_user|
      group_user.destroy
    end
      authorize @group
      redirect_to groups_path
  end


  def want_join
    @group = Group.find(params[:id])
    @wanted_to_join = GroupUser.new(user: current_user, group: @group, status: 'pending')
    @wanted_to_join.save
    authorize @group
    redirect_to groups_path
  end

  def accept_join
    # Step1 : le current_user d'abord accepte la demande d'un autre de rejoindre son groupe principal
     @group = current_user.groups.find do |group|
    group.category == 'principal'
       end

   # Step2 : le statut du groupuser du demandeur devient ainsi accepted et non plus pending
    @group_users = GroupUser.where(group: @group, status: "pending")

    @group_users.each do |group_user|
      group_user.status = 'accepted'
        end


     # NB = en contrepartie, le current_user va à son tour faire partie du groupe principal du demandeur.
     # Step 3 = on retrouve le  groupe principal de chaque groupuser accepté par le current_user
      @group_users = GroupUser.where(group: @group, status: "accepted")

       @group_users.each do |group_user|
          @group2 = group_user.user.groups.find do |group|
            unless group.founder == current_user
            group.category == 'principal'
            end
            end
        end

     # Step4 = j'ajoute ainsi le current_user dans le groupe principal du demandeur

        @group_user2 = GroupUser.new(group: @group2, user: current_user, status: 'accepted')
         unless @group_user2.present?
           group_user2.save
           authorize @group
          end

      redirect_to groups_path
  end

  def edit
  end

  private

  def group_params
    params.require(:group).permit(:title, )
  end

end
