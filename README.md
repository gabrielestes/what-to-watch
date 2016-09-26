# What to Watch

==

##Synopsis
#####This Ruby program was built to provide meaningful information based on a large pool of data from MovieLens. The program's data includes, most importantly, movie titles and IDs, user ratings, and user IDs.

#####The program provides the following info:
* Input: movie ID | Output: movie title
* Input: movie ID | Output: movie's average user rating
* Input: user ID | Output: user's reviews with movie titles
* Input: a number 1-100 | Output: top x number of movies


##Requirements
* Unix command line
* Ruby 2.3.0 or higher
* The what-to-watch repository files in a local directory

##Run the Program

#####1. Install Ruby.
[Follow these instructions.](https://www.ruby-lang.org/en/downloads/)

#####2. Clone the Repository.
[Click 'Clone or Download'](https://github.com/gabrielestes/blackjack)

#####3. Launch.
#####Locate the directory in the command line. Choose a command based on what output you want:

######Find ratings by movie ID
```
$ruby movie_class.rb
```

---

######Find title by ID
```
$ruby title_class.rb
```

---

######List the top "n" number of movies by review count and ratings
```
$ruby popular_movies.rb
```

---

######Find the average and all ratings by movie ID
```
$ruby movie_class.rb
```

##Code

#####Code example: this calculates the average of all ratings and keeps only movies with at least 3.5 stars. At this moment in the code, the pool of movies has already been reduced to the 100 most-reviewed.
```Ruby
  ratings_sum = 0
  ratings.each { |x| ratings_sum += x }
  @average_rating = (ratings_sum.to_f / f).round(1)
  @top_movies[id] = @average_rating if @average_rating >= 3.5
```

---

#####Code example: this organizes the top-rated, most-reviewed movies by rating, descending.
```Ruby
def sort_by_rating
  @top_movies = @top_movies.sort_by { |_k, v| -v }
  @top_movies = @top_movies[0..@top_x]
end
```

==

##Language

#####Written in Ruby


##Author

#####Gabriel Estes
