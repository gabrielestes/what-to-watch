require_relative 'movie_class'
require_relative 'movie_files_module'

# This class recommends the most popular movies
class PopularMovies < Movie
  include MovieFiles

  def initialize
  end

  def delete_first_last
    @popular_movie_data = @user_rating_data
    @popular_movie_data.each do |user|
      user.delete_at(3)
      user.delete_at(2)
      user.delete_at(0)
    end
  end

  def create_movie_hash
    @frequency = Hash.new(0)
    @popular_movie_data.sort_by { |id| @frequency[id] += 1 }
  end

  def sort_by_frequency
    @most_frequent_movies = @frequency.sort_by { |_k, v| -v }[0..200]
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
      if @average_rating >= 4.0
        @top_movies[id] = @average_rating
      end
    end
    puts @top_movies
  end
end

def main
  top_list = PopularMovies.new
  top_list.create_user_arrays
  top_list.delete_first_last
  top_list.create_movie_hash
  top_list.sort_by_frequency
  top_list.make_movie_lines_arrays
  top_list.create_user_arrays
  top_list.each_average_rating
end

main if __FILE__ == $PROGRAM_NAME
