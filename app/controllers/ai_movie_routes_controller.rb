class AiMovieRoutesController < ApplicationController

  # GET /ai_movie_routes/new
  def new
  end

  # GET /ai_movie_routes/generate
  def generate
    @movie_path = Search.generate_movie_path(params[:actor_1], params[:actor_2])
  end 
end
