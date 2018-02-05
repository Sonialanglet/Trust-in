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
         @categories = Category.new
    else
     @prestations = Prestation.all
     @category = Category.new
    end
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

  private

  def prestation_params
    params.require(:prestation).permit(:price, :description, :category_id, :photo)
  end

end
