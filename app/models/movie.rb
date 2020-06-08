class Movie < ApplicationRecord
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  has_many :playlist_movies
  has_many :playlists, through: :playlist_movies

  self.primary_key = "IMBD_ID"

  def self.get_movie_id(movie_title)
    api_key = ENV['tmdb_api_key']
    response = Faraday.get "https://api.themoviedb.org/3/search/movie?api_key=#{api_key}&language=en-US&query=#{movie_title}"
    response = JSON.parse response.body
    response['results'].empty? ? nil : response['results'][0]['id']
  end

  def self.get_movie_details(movie_id)
    api_key = ENV['tmdb_api_key']
    response = Faraday.get "https://api.themoviedb.org/3/movie/#{movie_id}?api_key=#{api_key}"
    response = JSON.parse response.body
  end
end
