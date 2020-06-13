class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :user_review, presence: true 
end
