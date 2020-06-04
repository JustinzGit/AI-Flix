class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  self.primary_key = "IMBD_ID"
end
