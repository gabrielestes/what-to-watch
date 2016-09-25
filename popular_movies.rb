require_relative 'movie_class'
require_relative 'movie_files_module'

# This class recommends the most popular movies
class PopularMovies < Movie
  include MovieFiles

  def initialize
  end

  def delete_first_last
    @user_rating_data.each do |user|
      user.delete_at(3)
      user.delete_at(2)
      user.delete_at(0)
    end
  end

  def create_movie_hash
    @frequency = Hash.new(0)
    @user_rating_data.sort_by { |id| @frequency[id] += 1 }
  end

  def sort_by_frequency
    @most_frequent_movies = @frequency.sort_by { |_k, v| -v }[0..200]
    p @most_frequent_movies
  end

def main
  top_list = PopularMovies.new
  top_list.create_user_arrays
  top_list.delete_first_last
  top_list.create_movie_hash
  top_list.sort_by_frequency
  top_list.make_movie_lines_arrays
end

main if __FILE__ == $PROGRAM_NAME
