class AddReviewToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :restaurant_id, index: true
  end
end
