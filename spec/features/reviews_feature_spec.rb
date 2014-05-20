require 'spec_helper'

describe 'reviews function' do
  before { Restaurant.create(name: 'KFC', address: '1 high st, London', cuisine: 'Chicken') }

  specify 'no reviews have been added' do
    visit('/restaurants')
    expect(page).to have_content 'No reviews'
  end

  
end