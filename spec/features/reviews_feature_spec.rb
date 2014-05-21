require 'spec_helper'
require 'helpers/helpers_spec'

describe 'reviews function' do

  before { Restaurant.create(name: 'KFC', address: '1 high st, London', cuisine: 'Chicken') }

  specify 'no reviews have been added' do
    visit('/restaurants')
    expect(page).to have_content 'No reviews'
  end

  it 'one review has been added', js: true do
  	add_review(5,"Very good, awesome")
		expect(current_path).to eq '/restaurants'
		expect(page).to have_content('Very good, awesome')
		expect(page).to have_content('5')
  end

  it 'should display number+review for one entry' do
  	add_review(5,"Very good")
		expect(current_path).to eq '/restaurants'
		expect(page).to have_content('1 review')
  end

  it 'should display number+reviews for more than one entry' do
  	add_review(5,"Very good")
  	fill_in "Comment", with: 'Sucks!'
		select('2', :from => 'Rating')
		click_on('Create Review')
		expect(current_path).to eq '/restaurants'
		expect(page).to have_content('2 reviews')
  end

	it 'can delete a review' do
	  add_review(5,"Very good, awesome!")
    click_on('Delete')
    expect(current_path).to eq '/restaurants'
    expect(page).to_not have_content 'Very good, awesome!'
  end

  # specify 'rating can never be bigger than 5' do
  # 	add_review_with_invalid_rating(100)
  # end

  # specify 'rating can never be lower than 1' do
 	# 	add_review_with_invalid_rating(0)
  # end

  # def add_review_with_invalid_rating(rating, comment="")
  # 	visit('/restaurants')
	 #  click_on('Add Review')
	 # 	fill_in "Comment", with: "#{comment}"
		# select("#{rating}", :from => 'Rating')
	 #  click_on('Create Review')
  #   expect(current_path).to eq '/restaurants'
  #   expect(page).to_not have_content "#{rating}"
  # end

end