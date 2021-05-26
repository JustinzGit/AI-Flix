class AiMovieRoutesController < ApplicationController

  # GET /ai_movie_routes/new
  def new
  end

  # GET /ai_movie_routes/generate
  def generate
    if !Search.load_complete?
      flash[:alert] = "Still Loading Data. Try again in a few seconds"
      render :new
    else 
      @movie_path = Search.generate_movie_path(params[:actor_1], params[:actor_2])
    end 
  end 
end
