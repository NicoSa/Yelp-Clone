require 'spec_helper'

describe Restaurant do

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
      Restaurant.new(:name => '').should have(2).error_on(:name)
    end

    it 'the address is not entered' do
      restaurant.should have(2).error_on(:address)
    end

    it 'the cuisine is not entered' do
      restaurant.should have(2).error_on(:cuisine)
    end

  end

  context 'it returns error when input is in invalid format' do

    let(:restaurant) { Restaurant.new(name: 'nandos', address: '1', cuisine: 'a')}

    it 'the name is not capitalized' do
      restaurant.should have(1).error_on(:name)
    end

    it 'the address is too short' do
      restaurant.should have(1).error_on(:address)
    end

    it 'the cuisine is too short' do
      restaurant.should have(1).error_on(:cuisine)
    end

  end
end
