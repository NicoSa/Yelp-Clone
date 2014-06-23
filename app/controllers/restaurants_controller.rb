class RestaurantsController < ApplicationController


  def new
    @restaurant = Restaurant.new
  end

  def index
    @restaurants = Restaurant.all
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.new(params[:restaurant].permit(:address, :name, :cuisine))
    if @restaurant.save
      redirect_to('/restaurants')
    else
      render 'new'
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(params[:restaurant].permit(:name, :address, :cuisine))
    redirect_to('/restaurants')
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    flash[:notice]='Entry Deleted'
    redirect_to('/restaurants')
  end

end
