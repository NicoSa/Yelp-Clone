require 'spec_helper'
require 'helpers/helpers_spec'

describe 'restaurants index page', js: true do

  context 'no restaurants have been added' do

    it 'should display a message' do
      visit('/restaurants')
      expect(page).to have_content 'No restaurants yet'
    end

  end

  context 'logged out' do

    it 'takes us to the sign in page' do
      visit('/')
      click_link 'Create Restaurant'

      expect(page).to have_content 'Login Register Name Address Cuisine'
    end

  end

  context 'logged in: creating a restaurant' do

    before do
      user = User.create(email: 'alex@a.com', password: 'testing1', password_confirmation: 'testing1')
      login_as user
    end

    context 'with valid data' do

      it 'adds it to the restaurants index' do
        create_restaurant("InAndOutBurger","1 California Drive, Los Angeles", "Burgers")

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


    context 'with invalid data' do

      it 'with invalid name' do
        create_restaurant
        expect(page).to have_content 'Error'
      end

    end

    context 'editing existing restaurants' do

      before { Restaurant.create(name: 'KFC', address: '1 high st, London', cuisine: 'Chicken') }

      before do
        user = User.create(email: 'alex@a.com', password: 'test', password_confirmation: 'test')
      end

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

  context 'logged out' do

    it 'shows no edit link' do
      visit('/restaurants')
      expect(page).not_to have_link('Edit KFC')
    end

    it 'shows no delete link' do
      visit('/restaurants')
      expect(page).not_to have_link('Delete KFC')
    end

  end

  context 'average rating' do

    before do
      user = User.create(email: 'alex@a.com', password: 'testing1', password_confirmation: 'testing1')
      login_as user
    end


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
      expect(page).to have_content 'Average Rating: 3.3'
    end

  end

end
