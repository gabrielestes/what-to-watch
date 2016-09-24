require_relative 'movie_class'
require_relative 'movie_files_module'

# This class recommends the most popular movies
class PopularMovies < Movie
  include MovieFiles

  def initialize
  end

  def delete_last_element
    @user_rating_data.each do |user|
      user.delete_at(0)
      user.delete_at(1)
      user.delete_at(1)
    end
    @user_rating_data
  end

  def create_movie_hash
    counts = Hash.new(0)
    @user_rating_data.each { |id| counts[id] += 1 }
    puts counts
  end

  def single_out_by_count
    @movie_review_storage = []
    @user_rating_data.each do |user|
      @movie_review_storage << user[1]
    end
    @movie_review_storage
  end

  # def store_movie_ratings
  #   @all_ratings = []
  #   @user_rating_data.each do |user|
  #     if return_average_rating >= 3
  #       @ratings << user[2].to_i
  #     end
  #   end
  #   puts "The ratings for this title are #{@ratings.flatten}."
  # end
  #
  # def remove_low_ratings
  # end
end

def main
  top_list = PopularMovies.new
  top_list.create_user_arrays
  top_list.delete_last_element
  top_list.create_movie_hash
end

main if __FILE__ == $PROGRAM_NAME
