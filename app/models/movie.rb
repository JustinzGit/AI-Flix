class Movie < ApplicationRecord
  has_many :playlist_movies
  has_many :playlists, through: :playlist_movies

  has_many :movie_actors
  has_many :actors, through: :movie_actors

  has_many :reviews
  has_many :users, through: :reviews

  self.primary_key = "tmdb_id"

  # Requirement, to be deleted
  scope :oldest, -> { order('year ASC').where("year != 'nil'").second }

  # # Search TMDB for movie ID
  # def self.get_movie_id(movie_title)
  #   api_key = ENV['tmdb_api_key']
  #   response = Faraday.get "https://api.themoviedb.org/3/search/movie?api_key=#{api_key}&language=en-US&query=#{movie_title}"
  #   response = JSON.parse response.body
  #   response['results'].empty? ? nil : response['results'][0]['id']
  # end

  # fetch data from TMDB
  # if data has not been collected
  def fetch_tmdb_data
    if !self.data_collected
      api_key = ENV['tmdb_api_key']
      response = Faraday.get "https://api.themoviedb.org/3/movie/#{self.id}?api_key=#{api_key}"
      response = JSON.parse response.body
      self.title = response['title']
      self.budget = response['budget']
      self.revenue = response['revenue']
      self.overview = response['overview']
      self.poster_path = response['poster_path']
      self.backdrop_path = response['backdrop_path']
      self.popularity = response['popularity']
      self.release_date = response['release_date']
      self.tagline = response['tagline']
      self.imdb_id = response['imdb_id']
      self.data_collected = true
      self.save
    end 
  end

  def self.fetch_popular_movies
    api_key = ENV['tmdb_api_key']
    response = Faraday.get "https://api.themoviedb.org/3/movie/popular?api_key=#{api_key}"
    response = JSON.parse response.body

    popular_movies = response['results'].map do |m|
      movie = Movie.find_by(tmdb_id: m['id'])
      if !movie
        movie = Movie.new
        movie.id = m['id']
        movie.fetch_tmdb_data
      end
      movie
    end
    popular_movies.sort_by(&:popularity).reverse
  end 

  # find movie titles that begin with provided input
  def self.search_by_title(title)
    where("title LIKE (?)", "#{title}%") if title
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
