class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
  	restaurant = Restaurant.find(params[:restaurant_id])
  	restaurant.reviews.create(params[:review].permit(:comment, :rating))
  	redirect_to('/restaurants')
  end

end
