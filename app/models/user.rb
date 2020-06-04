class User < ApplicationRecord
  has_many :playlists

  validates :email, presence: true
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true

  has_secure_password
end
