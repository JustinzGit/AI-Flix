class AiListsController < ApplicationController

  # GET /ai_lists/new
  def new
  end

  # POST /ai_lists
  def create 
    AiList.load_data
    @movie_path = AiList.find_movie_path(params[:actor_1], params[:actor_2])
  end 
end
