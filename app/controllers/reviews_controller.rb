class ReviewsController < ApplicationController

  # POST /reviews
  def create
    @review = Review.create(review_params)
    redirect_to movie_path(@review.movie_id)
  end

  # DELETE /reviews/:id
  def destroy
    @review = Review.find(params[:id])

    if !current_user.reviews.include?(@review)
      redirect_to homepage_path
    else
      movie = @review.movie_id
      @review.destroy
      redirect_to movie_path(movie) 
    end 
  end

  private

  def review_params
    params.require(:review).permit(:user_review, :user_id, :movie_id)
  end
end
