class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
  	@restaurant = Restaurant.find(params[:restaurant_id])
    puts @restaurant.reviews.find_by(user_id: params[:user_id]).nil?
      if @restaurant.reviews.find_by(user_id: params[:user_id]).nil?
        @review = @restaurant.reviews.create!(params[:review].permit(:comment, :rating))
        @review.user = current_user
        @review.save
        render 'create', content_type: :json
      else
        flash[:notice] = "You have rated this restaurant already!"
      end
  end


  def destroy
  	restaurant = Restaurant.find(params[:restaurant_id])
  	review_to_destroy = restaurant.reviews.find(params[:id])
  	review_to_destroy.destroy
  	redirect_to('/restaurants')
  end

end
