require 'CSV'
# require_relative '/data_set/u.data'
# require_relative '/data_set/u.item'

module MovieFiles
  def initialize
  end

  def create_user_arrays
    @user_rating_data = []
    CSV.foreach('data_set/u.data') do |line|
      line = line[0].gsub(/\s+/, ',').split(',')
      line.delete_at(3)
      @user_rating_data << line
    end
    @user_rating_data
  end

  def refine_user_ratings
    @popular_movie_data = @user_rating_data
    @popular_movie_data.each do |user|
      user.delete_at(2)
      user.delete_at(0)
    end
    @popular_movie_data
  end

  def sort_movies_by_frequency
    @frequency = Hash.new(0)
    @popular_movie_data.sort_by { |id| @frequency[id] += 1 }
    @most_frequent_movies = @frequency.sort_by { |_k, v| -v }[0..99]
    @most_frequent_movies
  end

  def make_movie_lines_arrays
    @movie_data = []
    CSV.foreach('data_set/u.item') do |line|
      line = line[0].split('|')
      @movie_data << line
    end
    @movie_data
  end
end
