require 'CSV'

# This class takes ID input and returns its ratings and average rating.
class Movie
  def initialize
  end

  def make_lines_arrays
    @user_rating_data = []
    CSV.foreach('data_set/u.data') do |line|
      line = line[0].gsub(/\s+/, ',').split(',')
      @user_rating_data << line
    end
  end

  def ask_for_movie
    puts 'What is the movie ID?'
    @movie_id = gets
    if @movie_id.to_i < 1
      ask_for_movie
    end
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
    average_rating = (ratings_sum.to_f / @ratings.count.to_f)
    puts "The average rating for this title is #{average_rating} stars."
  end

  def render_movie_title
  end
end

def main
  movie = Movie.new
  movie.make_lines_arrays
  movie.ask_for_movie
  movie.all_user_ratings
  movie.return_average_rating
end

main if __FILE__ == $PROGRAM_NAME
