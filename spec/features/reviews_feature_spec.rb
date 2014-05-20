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
	click_on('Create Review')
	expect(current_path).to eq '/restaurants'
	expect(page).to have_content('Very good, awesome')
	expect(page).to have_content('5')
  end

  it 'should display number+review for one entry' do
  	visit('/restaurants')
  	click_on('Add Review')
  	fill_in "Comment", with: 'Very good, awesome!'
	select('5', :from => 'Rating')
	click_on('Create Review')
	expect(current_path).to eq '/restaurants'
	expect(page).to have_content('1 review')
  end

  it 'should display number+reviews for more than one entry' do
  	visit('/restaurants')
  	click_on('Add Review')
  	fill_in "Comment", with: 'Very good, awesome!'
	select('5', :from => 'Rating')
	click_on('Create Review')
	click_on('Add Review')
  	fill_in "Comment", with: 'Sucks!'
	select('2', :from => 'Rating')
	click_on('Create Review')
	expect(current_path).to eq '/restaurants'
	expect(page).to have_content('2 reviews')
  end

  it 'can delete a review' do
	  visit('/restaurants')
	  click_on('Add Review')
	  fill_in "Comment", with: 'Very good, awesome!'
	  select('5', :from => 'Rating')
	  click_on('Create Review')
      click_on('Delete Very good, awesome!')
      expect(current_path).to eq '/restaurants'
      expect(page).to_not have_content 'Very good, awesome!'
  end

  
end