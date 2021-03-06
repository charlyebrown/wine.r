class WinesController < ApplicationController

  before_action :authenticate, only: [:new, :create]

  def index
    @wines = Wine.all
  end

  def search
    @results = Snooth.search(params[:search], params[:price])
    Wine.add_wines(@results)
  end

  def search_by_food
    @food = params[:food]
    @results = SnoothFood.search_by_food(@food, params[:price])
    Wine.add_wines(@results)
  end

  def add_to_user_favorites
    current_user.wines << Wine.find_by(code: params[:code])
    redirect_to user_path(current_user)
  end

  def show
    @wine = Wine.find(params[:id])
    @wine_reviews = WineReview.where(wine_id: params[:id])
  end

  def new
    @wine = Wine.new
  end

  def create
    @wine = Wine.new(wine_params)
    if @wine.save
      redirect_to wine_path(@wine)
    else
      render :new
    end
  end

  def edit
    @wine = Wine.find(params[:id])
  end

  def update
    @wine = Wine.find(params[:id])
    if @wine.update(wine_params)
      redirect_to wine_path(@wine)
    else
      render :edit
    end
  end

  def destroy
    @wine = Wine.find(params[:id])
    if @wine.destroy
      redirect_to wines_path
    else
      redirect_to wine_path(@wine)
    end
  end

  private

  def wine_params
    params.require(:wine).permit(:name, :varietal, :vintage, :region,
    :vineyard, :description, :flavor_profile, :color, :rating, :image)
  end

end
