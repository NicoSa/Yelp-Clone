require 'spec_helper'
require 'helpers/helpers_spec'

describe 'reviews function', js: true do

  before { Restaurant.create(name: 'KFC', address: '1 high st, London', cuisine: 'Chicken') }

  before do
    user = User.create(email: 'alex@a.com', password: 'testing1', password_confirmation: 'testing1')
    login_as user
  end

  specify 'no reviews have been added' do
    visit('/restaurants')
    expect(page).to have_content '0 reviews'
  end

  it 'one review has been added', js: true do
    add_review(5,"Very good, awesome")
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('Very good, awesome')
    expect(page).to have_content('★★★★★')
    within(".reviews") do
      expect(page).to have_content('alex@a.com')
    end
  end

  it 'should display number+review for one entry' do
    add_review(5,"Very good")
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('1 review')
    save_and_open_page
  end

  xit 'should show error if you want to post another review for the same restaurant' do
    add_review(5,"Very good")
    fill_in "Comment", with: 'Sucks!'
    select('2', :from => 'Rating')
    click_on('Create Review')
    expect(page).to have_content('You have rated this restaurant already!')
  end

  it 'can delete a review' do
    save_and_open_page
    add_review(5,"Very good, awesome!")
    click_on('Delete')
    expect(page).to_not have_content 'Very good, awesome!'
  end
end
