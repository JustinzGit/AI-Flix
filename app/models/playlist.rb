class Playlist < ApplicationRecord
  belongs_to :user

  has_many :playlist_movies
  has_many :movies, through: :playlist_movies
end
