class WinesController < ApplicationController

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
    @results = snooth.search(params[:search])
  end

  def add_wine
    new_wine = snooth.search_by_id(params[:code])
    @wine = Wine.find_or_create_by(new_wine.first)
    redirect_to wine_path(@wine)
  end

  private

  def wine_params
    params.require(:wine).permit(:name, :varietal, :vintage, :region,
    :vineyard, :description, :flavor_profile, :color, :rating, :image)
  end


end
