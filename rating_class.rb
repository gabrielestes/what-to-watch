require_relative 'movie_class'
require_relative 'user_class'
require 'CSV'

ratings = []
CSV.foreach('data_set/u.data') do |line|
  ratings << line
end

  p ratings

class Rating #relates a movie to a user
  movie id
  user id

end
