require 'spec_helper'
require 'helpers/helpers_spec'

describe 'restaurants index page' do

  context 'no restaurants have been added' do

    it 'should display a message' do
      visit('/restaurants')
      expect(page).to have_content 'No restaurants yet'
    end

  end

  context 'creating a restaurant' do


    it 'adds it to the restaurants index' do
      create_restaurant("InAndOutBurger","1 California Drive, Los Angeles", "Burgers")

      expect(current_path).to eq '/restaurants'
      expect(page).to have_content 'InAndOutBurger'

      restaurant = Restaurant.first
      expect(restaurant.name).to eq('InAndOutBurger')
      expect(restaurant.address).to eq('1 California Drive, Los Angeles')
      expect(restaurant.cuisine).to eq('Burgers')
    end

    it 'can add a different restaurant' do
      create_restaurant("Lardo", "205 Richmond Road, London", "Pizzaria")

      expect(current_path).to eq '/restaurants'
      expect(page).to have_content 'Lardo'
    end

  end


  context 'creating an INVALID restaurant' do

    it 'with invalid name' do
      create_restaurant
      expect(page).to have_content 'Error'
    end

  end

  context 'editing existing restaurants' do

    before { Restaurant.create(name: 'KFC', address: '1 high st, London', cuisine: 'Chicken') }

    it 'can change the name of a restaurant' do
      visit('/restaurants')
      click_on 'Edit KFC'
      fill_in 'Name', with: 'Mother Clucker'
      click_button 'Update Restaurant'
      expect(current_path).to eq '/restaurants'
      expect(page).to have_content 'Mother Clucker'
    end

    it 'can delete a restaurant' do
      visit('/restaurants')
      click_on 'Delete KFC'
      expect(current_path).to eq '/restaurants'
      expect(page).to_not have_content 'KFC'
      expect(page).to have_content 'Entry Deleted'
    end

  end

  context 'average rating' do

    it 'displays average rating for a restaurant with two reviews' do
      create_restaurant("Apo's Peninsula Restaurant", "Polichrono", "Greek")
      add_review(5)
      add_review(3)

      expect(current_path).to eq '/restaurants'
      expect(page).to have_content 'Average Rating: 4'
    end

    it 'displays average rating for a restaurant with three reviews' do
      create_restaurant("Apo's Peninsula Restaurant", "Polichrono", "Greek")
      add_review(5)
      add_review(3)
      add_review(2)

      expect(current_path).to eq '/restaurants'
      expect(page).to have_content 'Average Rating: 3'
    end

  end

end
