require 'spec_helper'

describe Review do

	it "is invalid if rating is bigger than 5" do
		review = Review.new(rating: 1000000)
		expect(review).to have(1).error_on(:rating)
	end

	it "is invalid if rating is smaller than 1" do
		review = Review.new(rating: 0)
		expect(review).to have(1).error_on(:rating)
	end

end