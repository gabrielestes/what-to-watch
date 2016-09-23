require 'CSV'

# This class takes ID input and returns its ratings and average rating.
class Movie
  def initialize(movie_id)
    @movie_id = movie_id
  end

  def make_lines_arrays
    @movie_data = []
    CSV.foreach('data_set/u.data') do |line|
      line = line[0].gsub(/\s+/, ',').split(',')
      @movie_data << line
    end
  end

  # def ask_for_movie
  #   puts 'What is the movie ID?'
  #   @movie_id = gets
  #   if @movie_id.to_i < 1
  #     ask_for_movie
  #   end
  #   true
  # end

  def all_user_ratings
    @ratings = []
    @movie_data.each do |user|
      if user[1].to_i == @movie_id.to_i
        @ratings << user[2].to_i
      end
    end
    puts "The ratings for this title are #{@ratings.flatten}."
    true
  end

  def return_average_rating
    ratings_sum = 0
    @ratings.each { |x| ratings_sum += x }
    average_rating = ratings_sum / @ratings.count
    "The average rating for this title is #{average_rating} stars."
  end

  def render_movie_title
  end
end

def main
  movie = Movie.new(movie_id)
  movie.make_lines_arrays
  puts ask_for_movie
  print all_user_ratings
  puts return_average_rating
end

main if __FILE__ == $PROGRAM_NAME
