class Playlist < ApplicationRecord
  belongs_to :user

  has_many :playlist_movies
  has_many :playlist_actors
  
  has_many :movies, through: :playlist_movies
  has_many :actors, through: :playlist_actors
end
