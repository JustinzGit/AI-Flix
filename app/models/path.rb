class Path < ApplicationRecord
  belongs_to :user

  has_many :path_movies
  has_many :path_actors

  has_many :movies, through: :path_movies
  has_many :actors, through: :path_actors
end
