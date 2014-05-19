class RestaurantsController < ApplicationController


	def new
		@restaurant = Restaurant.new
	end

	def index
		@restaurants = Restaurant.all
	end

	def create
		Restaurant.create({name: 'InAndOutBurger', address: '1 California Drive, Los Angeles'})
		redirect_to('/restaurants')
	end

end
