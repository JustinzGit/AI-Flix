class Movie < ApplicationRecord
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  self.primary_key = "IMBD_ID" 
end
