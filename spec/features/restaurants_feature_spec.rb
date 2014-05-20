require 'spec_helper'

describe 'restaurants index page' do

  context 'no restaurants have been added' do
    it 'should display a message' do
      visit('/restaurants')
      expect(page).to have_content 'No restaurants yet'
    end
  end

  context 'creating a restaurant' do
    it 'adds it to the restaurants index' do
      visit ('/restaurants/new')
      fill_in 'Name', with: 'InAndOutBurger'
      fill_in 'Address', with: '1 California Drive, Los Angeles'
      fill_in 'Cuisine', with: 'Burgers'
      click_button 'Create Restaurant'

      expect(current_path).to eq '/restaurants'
      expect(page).to have_content 'InAndOutBurger'

      restaurant = Restaurant.first
      expect(restaurant.name).to eq('InAndOutBurger')
      expect(restaurant.address).to eq('1 California Drive, Los Angeles')
      expect(restaurant.cuisine).to eq('Burgers')
    end

    it 'can add a different restaurant' do
      visit ('/restaurants/new')
      fill_in 'Name', with: 'Lardo'
      fill_in 'Address', with: '205 Richmond Road, London'
      fill_in 'Cuisine', with: 'Pizzaria'
      click_button 'Create Restaurant'

      expect(current_path).to eq '/restaurants'
      expect(page).to have_content 'Lardo'
    end
  end


  context 'creating an INVALID restaurant' do
    it 'with invalid name' do
      visit('/restaurants/new')
      fill_in 'Name', with: ''
      fill_in 'Address', with: ''
      fill_in 'Cuisine', with: ''
      click_button 'Create Restaurant'
      expect(page).to have_content 'Error'
    end
  end

  context 'editing existing restaurants' do
    before { Restaurant.create(name: 'KFC', address: '1 high st, London') }
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

end
