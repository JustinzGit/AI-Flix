class Movie < ApplicationRecord
  has_many :playlist_movies
  has_many :playlists, through: :playlist_movies

  has_many :movie_actors
  has_many :actors, through: :movie_actors

  has_many :reviews
  has_many :users, through: :reviews

  self.primary_key = "tmdb_id"

  @@api_key = ENV['tmdb_api_key']

  # fetch data from TMDB
  # if data has not been collected
  def fetch_tmdb_data
    
    if !self.data_collected
      response = Faraday.get "https://api.themoviedb.org/3/movie/#{self.id}?api_key=#{@@api_key}"
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

  def fetch_actors
    if self.actors.empty?
      response = Faraday.get "https://api.themoviedb.org/3/movie/#{self.id}/credits?api_key=#{@@api_key}"
      response = JSON.parse response.body
      response['cast'].each do |a|
        actor = Actor.find_by(tmdb_id: a['id'])
        self.actors << actor if actor
      end
    end  
  end 

  def self.fetch_popular_movies
    api_key = ENV['tmdb_api_key']
    response = Faraday.get "https://api.themoviedb.org/3/movie/popular?api_key=#{@@api_key}"
    response = JSON.parse response.body

    popular_movies = response['results'].map do |m|
      movie = Movie.find_by(tmdb_id: m['id'])
      if !movie
        movie = Movie.new
        movie.id = m['id']

        movie_data = Faraday.get "https://api.themoviedb.org/3/movie/#{movie.id}?api_key=#{@@api_key}"
        movie_data = JSON.parse movie_data.body
        movie.title = movie_data['title']
        movie.popularity = movie_data['popularity']
      end
      movie
    end
    popular_movies.sort_by(&:popularity).reverse
  end 

  # find movie titles that begin with provided input
  def self.search_by_title(title)
    where("title ILIKE (?)", "#{title}%") if title
  end
end
