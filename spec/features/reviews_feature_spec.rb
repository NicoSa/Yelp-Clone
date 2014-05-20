require 'spec_helper'

describe 'reviews function' do
  
  before { Restaurant.create(name: 'KFC', address: '1 high st, London', cuisine: 'Chicken') }

  specify 'no reviews have been added' do
    visit('/restaurants')
    expect(page).to have_content 'No reviews'
  end

  it 'one review has been added' do
  	visit('/restaurants')
  	click_on('Add Review')
  	fill_in "Comment", with: 'Very good, awesome!'
	select('5', :from => 'Rating')
	click_on('Submit Review')
	expect(current_path).to eq '/restaurants'
	expect(page).to have_content('Very good, awesome')
	expect(page).to have_content('5')
  end

  
end