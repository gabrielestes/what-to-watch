require_relative 'movie_class'
require_relative 'movie_files_module'

# This class recommends the most popular movies
class PopularMovies < Movie
  include MovieFiles

  def initialize
  end

  def each_average_rating
    @top_movies = {}
    @most_frequent_movies.each do |id, f|
      ratings = []
      @user_rating_data.each do |user|
        if user[1].to_i == id[0].to_i
          ratings << user[2].to_i
        end
      end
      ratings_sum = 0
      ratings.each { |x| ratings_sum += x }
      @average_rating = (ratings_sum.to_f / f).round(1)
      @top_movies[id] = @average_rating if @average_rating >= 3.5
    end
  end

  def ask_for_x
    puts 'How many movies would you like to see by rating?'
    @top_x = gets.chomp.to_i
  end

  def sort_by_rating
    @top_movies = @top_movies.sort_by { |_k, v| -v }
    @top_movies = @top_movies[0..@top_x]
  end

  def convert_to_title
    @top_movies.each do |id, avg|
      @movie_title = @movie_data[id[0].to_i - 1][1]
      puts "#{@movie_title}, #{avg} stars."
    end
  end
end

def main
  top_list = PopularMovies.new
  top_list.create_user_arrays
  top_list.refine_user_ratings
  top_list.sort_movies_by_frequency
  top_list.make_movie_lines_arrays
  top_list.create_user_arrays # Try to NOT to create the data again.
  top_list.each_average_rating
  top_list.ask_for_x
  top_list.sort_by_rating
  puts "The top #{@top_x} movies are:"
  top_list.convert_to_title
end

main if __FILE__ == $PROGRAM_NAME
