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

end
