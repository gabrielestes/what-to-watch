# user id = user[0]
# age = user [1]| gender | occupation | zip code
# require_relative 'data_set/user.txt'
require 'CSV'
user_data = []
CSV.foreach('data_set/u.data') do |line|
  line = line[0].gsub(/\s+/, ",").split(',')
  p line
end


class User
  id
  name
  email address
  ratings
  def find_favorite_genre
  end
end

# def main
#   print File.dirname(__FILE__)
# end
#
# main if __FILE__ == $PROGRAM_NAME
