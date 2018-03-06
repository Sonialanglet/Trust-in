class PrestationsController < ApplicationController
  def index
    policy_scope(Prestation)
    if params[:query].present?
      sql_query = " \
           prestations.description ILIKE :query \
           OR users.first_name ILIKE :query \
           OR categories.name ILIKE :query \
           OR users.last_name ILIKE :query \
         "
         @prestations = Prestation.joins(:user, :category).where(sql_query, query: "%#{params[:query]}%")
         @category = Category.new
         @recomand = Recomand.new
    else
      @recomanded_prestations = policy_scope(Prestation)
      .joins(
        "JOIN recomands r ON prestations.id = r.prestation_id
        JOIN users user_prestation ON user_prestation.id = prestations.user_id
        JOIN users user_recomand ON user_recomand.id = r.user_id
        JOIN group_users ON group_users.user_id = user_recomand.id
        JOIN group_users my_group_users ON my_group_users.group_id = group_users.group_id
        ")
        .distinct
        .where("my_group_users.user_id" => current_user.id)

      @prestations = policy_scope(Prestation)
        .where.not(id:@recomanded_prestations.map(&:id))
      @recomand = Recomand.new
    end
  end

  def recomanded_prestations
    @prestations = policy_scope(Prestation).where(
      "id in (SELECT prestation_id FROM recomands WHERE
        user_id = #{current_user.id})"
        )
    render :index
  end

  def show
    @prestation = Prestation.find(params[:id])
    authorize @prestation
    @category = Category.new
    @review = Review.new

  end

  def new
    @prestation = Prestation.new
    authorize @prestation
    @category = Category.new

  end

  def create
    @prestation = Prestation.new(prestation_params)
    @prestation.user = current_user


    authorize @prestation
    if @prestation.save
      redirect_to prestation_path(@prestation)
    else
      render :new
    end
  end

  def edit
    @prestation = Prestation.find(params[:id])
    authorize @prestation

  end

  def destroy
    @prestation = Prestation.find(params[:id])
    authorize @prestation
    @prestation.destroy

    redirect_to prestations_path
  end



  def update
    @prestation = Prestation.find(params[:id])
    @prestation.update(prestation_params)
    authorize @prestation
    redirect_to prestation_path(@prestation)
  end


  def recomandation
    @prestation = Prestation.find(params[:id])

    @recomand = Recomand.new(prestation:@prestation, user:current_user)
       # @prestation.recomands.create
    authorize @prestation

    @recomand.save
    redirect_to prestations_path
   end

  private

  def prestation_params
    params.require(:prestation).permit(:price, :description, :category_id, :photo)
  end


end
