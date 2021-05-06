class AiRoutesController < ApplicationController

  # GET /ai_routes/new
  def new
  end

  # POST /ai_routes
  def create 
    AiRoute.load_data
    @movie_path = AiRoute.find_movie_path(params[:actor_1], params[:actor_2])
  end 
end
