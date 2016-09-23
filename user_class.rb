require 'CSV'
require 'pry'
require_relative 'title_class'
# This class retrieves ratings from a user based on user ID
class User < MovieTitle
  def initialize
    @user_rating_data = []
    @user_ratings = []
  end

  def make_user_data_arrays # Make this method inherited
    CSV.foreach('data_set/u.data') do |line|
      line = line[0].gsub(/\s+/, ',').split(',')
      @user_rating_data << line
    end
    @user_rating_data
  end

  def ask_user_id
    puts 'What is the user ID?'
    @user_id = gets
    ask_user_id if @user_id.to_i < 1
    @user_id = @user_id.to_i
  end

  def verify_user_id
    ask_user_id if @user_id < 1 || @user_id > 943
  end

  def retrieve_user_ratings
    @user_rating_data.each do |user|
      if user[0].to_i == @user_id
        @user_ratings << user[2]
        @movie_id = user[1]
      end
    end
    @user_ratings
  end
end

def which_film?
  puts "Search this user's reviews by movie title:"
  @title = gets.downcase
end


def main
  user = User.new
  user.make_user_data_arrays
  print user.make_movie_lines_arrays
  user.ask_user_id
  user.verify_user_id
  print user.retrieve_user_ratings
end

main if __FILE__ == $PROGRAM_NAME
