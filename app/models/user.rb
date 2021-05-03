class User < ApplicationRecord
  has_many :paths
  has_many :playlists

  has_many :reviews
  has_many :movies, through: :reviews

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_secure_password
end
