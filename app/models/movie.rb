class Movie < ApplicationRecord
  has_many :playlist_movies
  has_many :playlists, through: :playlist_movies

  has_many :movie_actors
  has_many :actors, through: :movie_actors

  has_many :path_movies
  has_many :paths, through: :path_movies

  has_many :reviews
  has_many :users, through: :reviews

  self.primary_key = "IMBD_ID"

  # Search TMDB for movie ID
  def self.get_movie_id(movie_title)
    api_key = ENV['tmdb_api_key']
    response = Faraday.get "https://api.themoviedb.org/3/search/movie?api_key=#{api_key}&language=en-US&query=#{movie_title}"
    response = JSON.parse response.body
    response['results'].empty? ? nil : response['results'][0]['id']
  end

  # Use movie ID to obtain movie data from TMDB
  def self.get_movie_data(movie_id)
    if movie_id.nil?
      return nil 
    else
      api_key = ENV['tmdb_api_key']
      response = Faraday.get "https://api.themoviedb.org/3/movie/#{movie_id}?api_key=#{api_key}"
      response = JSON.parse response.body
      movie_data = {
        title: response['title'],
        budget: response['budget'],
        revenue: response['revenue'],
        overview: response['overview'],
        image: response['poster_path'],
        release_date: response['release_date'],
        tagline: response['tagline'],
        imdb_id: response['imdb_id']
      }
    end 
  end

  # Obtain TMDB data on provided movie
  def self.get_tmdb_data(movie_title)
    movie_id = self.get_movie_id(movie_title)
    movie_id.nil? ? nil : self.get_movie_data(movie_id)
  end

  # Find movie titles that begin with provided input
  def self.begins_with(char)
    where("title LIKE (?)", "#{char}%")
  end

  # Find movies released in a provided year 
  def self.released_in(year)
    where("year == (?)", year)
  end

  # Find movies with provided title released in a provided year
  def self.find_movies(title, year)
    movies = self.begins_with(title)
    movies = movies.where("year == (?)", year)
  end
end
