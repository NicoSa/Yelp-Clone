class RemoveRestaurantIdidFromReviews < ActiveRecord::Migration
  def change
  	remove_column :reviews, :restaurant_id_id
  end
end
