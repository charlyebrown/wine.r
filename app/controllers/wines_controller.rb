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
    
  end

  def destroy
  end

  private

  def wine_params
    params.require(:wine).permit(:name, :grape_blend, :year, :region,
    :vineyard, :description, :flavor_profile, :color, :rating)
  end


end
