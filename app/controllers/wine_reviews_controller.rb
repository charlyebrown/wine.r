class WineReviewsController < ApplicationController

  before_action :authenticate, only: [:edit, :update, :destroy]

  def index
    @user = current_user
  end

  def new
    @wine_review = WineReview.new
    @wine = Wine.find(params[:wine_id])
  end

  def create
    @wine_review = WineReview.new(wine_review_params)
    @wine_review.user = current_user
    if @wine_review.save!
      redirect_to wine_review_path(@wine_review)
    else
      @wine = Wine.find(params[:wine_id])
      @user = User.find(session[:current_user])
      render :new
    end
  end

  def show
    @wine_review = WineReview.find(params[:id])
  end

  def edit
    @wine_review = WineReview.find(params[:id])
    @wine = Wine.find(@wine_review.wine_id)
  end

  def update
    @wine_review = WineReview.find(params[:id])
    @wine = Wine.find(@wine_review.wine_id)
    if @wine_review.update(wine_review_params)
      redirect_to wine_path(@wine)
    else
      render :edit
    end
  end


  def destroy
    @wine_review = WineReview.find(params[:id])
    @user = User.find(session[:current_user])
    @wine = Wine.find(params[:wine_id])
    if @wine_review.destroy
      redirect_to wine_path(@wine)
    else
      redirect to wine_path(@wine)
    end
  end

  private

  def wine_review_params
    params.require(:wine_review).permit(:wine_id, :title, :content, :rating)
  end

end
