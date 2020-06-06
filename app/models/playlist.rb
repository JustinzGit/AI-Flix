class Playlist < ApplicationRecord
  belongs_to :user
  has_many :actors
  has_many :movies
end
