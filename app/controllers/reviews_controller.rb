class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
  	@restaurant = Restaurant.find(params[:restaurant_id])
    review = @restaurant.reviews.create!(params[:review].permit(:comment, :rating))
      respond_to do |format|
        format.html{ redirect_to '/restaurants' }
        format.json{ render json: review }
      end
  end


  def destroy
  	restaurant = Restaurant.find(params[:restaurant_id])
  	to_destroy = restaurant.reviews.find(params[:id])
  	to_destroy.destroy
  	redirect_to('/restaurants')
  end

end
