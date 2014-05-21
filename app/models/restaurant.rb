class Restaurant < ActiveRecord::Base
  validates :name, presence: true,  format: { with: /\A[A-Z]/, message: "Error: Name not capitalized"}
  validates :address, presence: true, format: { with: /.../ , message: "Error: Address needs to be longer"}
  validates :cuisine, presence: true, format: { with: /.../, message: "Error: Cuisine needs to be longer"}

  has_many :reviews

  def average_rating
    reviews.average(:rating)
  end
end
