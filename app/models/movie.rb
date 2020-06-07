class Movie < ApplicationRecord
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  has_many :playlist_movies
  has_many :playlists, through: :playlist_movies


  self.primary_key = "IMBD_ID"
end
