require 'CSV'

class MovieTitle
  def initialize
  end

  def make_movie_lines_arrays
    @movie_data = []
    CSV.foreach('data_set/u.item') do |line|
      line = line[0].split('|')
      p line
      @movie_data << line
    end
  end
  # def ask_id_of_movie
  # puts "What is the movie ID?"
  # @movie_id = gets.to.i
  # end
  #
  # def convert_to_title
  #   @movie_data.each do
  # end
end

def main
  title = MovieTitle.new
  title.make_movie_lines_arrays
  # p @movie_data
end

main if __FILE__ == $PROGRAM_NAME
