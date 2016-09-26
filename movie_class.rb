require_relative 'movie_files_module'

# This class takes ID input and returns its ratings and average rating.
class Movie
  include MovieFiles
  def initialize
  end

  def ask_for_movie
    puts 'What is the movie ID?'
    @movie_id = gets
    ask_for_movie if @movie_id.to_i < 1
    @movie_id = @movie_id.to_i
  end

  def all_user_ratings
    @ratings = []
    @user_rating_data.each do |user|
      if user[1].to_i == @movie_id
        @ratings << user[2].to_i
      end
    end
    puts "The ratings for this title are #{@ratings.flatten}."
  end

  def return_average_rating
    ratings_sum = 0
    @ratings.each { |x| ratings_sum += x }
    average_rating = (ratings_sum / @ratings.count.to_f).round(1)
    puts "The average rating for this title is #{average_rating} stars."
  end
end

def main
  movie = Movie.new
  movie.create_user_arrays
  movie.ask_for_movie
  movie.all_user_ratings
  movie.return_average_rating
end

main if __FILE__ == $PROGRAM_NAME
