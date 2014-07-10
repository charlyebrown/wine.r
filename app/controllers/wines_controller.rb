class WinesController < ApplicationController

  before_action :authenticate, only: [:new, :create]

  def index
    @wines = Wine.all
  end

  def show
    @wine = Wine.find(params[:id])
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
    if @wine.update(movie_params)
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

  def search
    @results = Snooth.search_wines(params[:search])
    Wine.add_wines(@results)
  end

  def add_to_user_favorites
    user_favorite_wine = Wine.find_by(code: params[:code])
    user = User.find(session[:current_user])
    user.wines << user_favorite_wine
    redirect_to user_path(user)
  end

  private

  def wine_params
    params.require(:wine).permit(:name, :varietal, :vintage, :region,
    :vineyard, :description, :flavor_profile, :color, :rating, :image)
  end

end
