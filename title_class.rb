require 'CSV'
require 'pry'
# This class retrieves and prints a movie title corresponding to the movie ID
class MovieTitle
  def initialize
  end

  def make_movie_lines_arrays
    @movie_data = []
    CSV.foreach('data_set/u.item') do |line|
      line = line[0].split('|')
      @movie_data << line
    end
    @movie_data
  end

  def ask_id_of_movie
    puts 'What is the movie ID?'
    @movie_id = gets.to_i
  end

  def verify_movie_id
    ask_id_of_movie if @movie_id < 1
  end

  def convert_to_title
    @movie_data.each do |movie|
      @movie_title = movie[1] if movie[0].to_i == @movie_id.to_i
    end
    return @movie_title
  end
end

def main
  title = MovieTitle.new
  title.make_movie_lines_arrays
  title.ask_id_of_movie
  title.convert_to_title
end

main if __FILE__ == $PROGRAM_NAME
