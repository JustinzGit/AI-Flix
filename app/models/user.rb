class User < ApplicationRecord
  has_many :paths
  has_many :playlists

  has_many :reviews
  has_many :movies, through: :reviews

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  validates :password, presence: true, confirmation: true, length: {in: 8..15}
  validates :password_confirmation, presence: true

  has_secure_password
end
