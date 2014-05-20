require 'spec_helper'

describe RestaurantsController do

  context 'it does not return an error' do
    it 'when the restaurant is entered with all the correct details'do
      restaurant = Restaurant.new(name: 'Nandos', address: '1 main street, london', cuisine: 'mozambiquian')
      restaurant.should have(0).errors_on(:name)
      restaurant.should have(0).errors_on(:address)
      restaurant.should have(0).errors_on(:cuisine)
    end
  end

  context 'it returns error when input is left blank' do
    let(:restaurant){ Restaurant.new }

    it 'the name is not entered' do
      restaurant.should have(1).error_on(:name)
    end

    it 'the address is not entered' do
      restaurant.should have(1).error_on(:address)
    end

    xit 'the cuisine is not entered' do
    end

  end

  context 'it returns error when input is in invalid format' do

   xit 'the name is not capitalized' do
      Restaurant.new(name: 'nico').should have(1).error_on(:name)
    end

    xit 'the address is too short' do
    end

    xit 'the cuisine is too short' do
    end

  end
end
