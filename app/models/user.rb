class User < ApplicationRecord
  has_many :ai_lists
  has_many :playlists

  has_many :reviews
  has_many :movies, through: :reviews

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: {in: 8..15}

  has_secure_password
end
