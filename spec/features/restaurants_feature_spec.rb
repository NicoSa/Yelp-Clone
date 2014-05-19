require 'spec_helper'

describe 'restaurants index page' do
  
  context 'no restaurants have been added' do
    it 'should display a message' do
      visit('/restaurants')
      expect(page).to have_content 'No restaurants yet'
    end
  end

end