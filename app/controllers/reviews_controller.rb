class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @review.save
    redirect_to movie_path(@review.movie_id)
  end

  private

  def review_params
    params.require(:review).permit(:user_review, :user_id, :movie_id)
  end
end
