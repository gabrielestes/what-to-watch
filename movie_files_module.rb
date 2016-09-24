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
      @user_rating_data << line
    end
    @user_rating_data
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
