class RestaurantsController < ApplicationController


	def new
		@restaurant = Restaurant.new
	end

	def index
		@restaurants = Restaurant.all
	end

	def create
		# {name: params["restaurant"]["name"], address: params["restaurant"]["address"]}
		Restaurant.create(params[:restaurant].permit(:address, :name))
		redirect_to('/restaurants')
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])

		@restaurant.update(params[:restaurant].permit(:name, :address))
		redirect_to('/restaurants')
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy
		flash[:notice]=String
		redirect_to('/restaurants')
	end

end
