def create_restaurant(name="", address="", cuisine="")
  visit ('/restaurants/new')
  fill_in 'Name', with: "#{name}"
  fill_in 'Address', with: "#{address}"
  fill_in 'Cuisine', with: "#{cuisine}"
  click_button 'Create Restaurant'
end

def add_review(rating, comment="")
  visit('/restaurants')
  fill_in "Comment", with: "#{comment}"
  select("#{rating}", :from => 'Rating')
  click_on('Create Review')
end