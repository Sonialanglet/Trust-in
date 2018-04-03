class GroupsController < ApplicationController
  def index
    policy_scope(Group)
    if params[:query].present?
      sql_query = " \
           groups.title ILIKE :query \

         "
         @groups = Group.where(sql_query, query: "%#{params[:query]}%")

    else
# @recomanded_prestations = policy_scope(Prestation)
#       .joins(
#         "JOIN recomands r ON prestations.id = r.prestation_id
#         JOIN users user_prestation ON user_prestation.id = prestations.user_id
#         JOIN users user_recomand ON user_recomand.id = r.user_id
#         JOIN group_users ON group_users.user_id = user_recomand.id
#         JOIN group_users my_group_users ON my_group_users.group_id = group_users.group_id
#         ")
#         .distinct
#         .where("my_group_users.user_id" => current_user.id)

      # @pending_users = Group.all
      #   .includes('users.*')
      #   .joins(
      #     "JOIN group_users ON group_users.group_id = groups.id
      #     JOIN users ON users.id = group_users.user_id
      #     ")
      #   .where("group_users.status='pending' AND groups.founder_id <> ?  AND groups.category = 'principal'", current_user.id)

      @pending_users = User.all
        .joins(
          "JOIN group_users ON group_users.user_id = users.id
          JOIN groups ON groups.id = group_users.group_id
          ")
        .where("group_users.status='pending' AND groups.founder_id = ?  AND groups.category = 'principal'", current_user.id)

      @accepted_users = User.all
        .joins(
          "JOIN group_users ON group_users.user_id = users.id
          JOIN groups ON groups.id = group_users.group_id
          ")
        .where("group_users.status='accepted' AND groups.founder_id = ?  AND groups.category = 'principal' AND users.id <> ?", current_user.id, current_user.id)

      @prospected_users = User.all
        .where("users.id NOT IN (SELECT user_id FROM group_users WHERE group_id IN (SELECT id FROM groups WHERE founder_id = ? AND category = 'principal'))", current_user.id)

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
    authorize @group_user
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
      authorize @group_user
      authorize @group
      redirect_to groups_path
  end


  def want_join
    @group = Group.find(params[:id])
    @wanted_to_join = GroupUser.create(user: current_user, group: @group, status: 'pending')
   if
    @wanted_to_join.save
     authorize @group
    redirect_to groups_path, notice: 'Votre demande a bien été envoyée'
else

  authorize @group
  redirect_to groups_path, notice: 'impossible'
end


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
      group_user.save
    end


     # NB = en contrepartie, le current_user va à son tour faire partie du groupe principal du demandeur.
     # Step 3 = on retrouve le  groupe principal de chaque groupuser accepté par le current_user
      @group_users = GroupUser.where(group: @group, status: "accepted")

       @group_users.each do |group_user|
         @group2 = group_user.user.groups.where(category: "principal").first
     # Step4 = j'ajoute ainsi le current_user dans le groupe principal du demandeur
         @group_user = GroupUser.new(group: @group2, user: current_user, status: 'accepted')
         @group_user.save
         authorize @group_user
        authorize @group

      end

      redirect_to groups_path
  end

  def edit
  end

  private

  def group_params
    params.require(:group).permit(:title)
  end

end
