class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  has_many :playlists, through: :playlist_actors
  has_many :playlists, through: :playlist_movies

  self.primary_key = "IMBD_ID"
end
