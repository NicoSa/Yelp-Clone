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
      click_button 'Create Restaurant'

      expect(current_path).to eq '/restaurants'
      expect(page).to have_content 'InAndOutBurger'
    end

    it 'can add a different restaurant' do
      visit ('/restaurants/new')
      fill_in 'Name', with: 'Lardo'
      fill_in 'Address', with: '1 California Drive, Los Angeles'
      click_button 'Create Restaurant'

      expect(current_path).to eq '/restaurants'
      expect(page).to have_content 'Lardo'
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
      expect(page).to_not have_content 'KFC'
      expect(page).to have_content 'KFC Deleted'
    end

  end

end
