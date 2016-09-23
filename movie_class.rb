# This document retrieves movie reviews by ID
require 'CSV'

class Movie
  def initialize(movie_id)
    @movie_id = movie_id
  end

  def thing
    @movie_data = []
    CSV.foreach('data_set/u.data') do |line|
      line = line[0].gsub(/\s+/, ',').split(',')
      @movie_data << line
    end
  end

  def all_user_ratings
    @ratings = []
    @movie_data.each do |user|
      if user[1].to_i == @movie_id
        @ratings << user[2].to_i
      end
    end
    print @ratings

  end
  #
  # def get_average_rating # consider that number of ratings should have a minimum to be significant
  #
  # end
  #
  # def get_movie_title
  #
  # end

end

def main
  movie = Movie.new(movie_id)
  # movie.all_user_ratings
  # movie.get_average_rating
  # movie.get_movie_title
end

main if __FILE__ == $PROGRAM_NAME
