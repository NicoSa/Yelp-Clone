module ReviewsHelper

  def star_rating(rating)
    return rating unless rating.respond_to?(:round)
    rating = rating.round
    filled_stars = "★" * rating
    empty_stars = "☆" * (5 - rating)

    filled_stars + empty_stars
  end

end
