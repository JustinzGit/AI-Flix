class AiListsController < ApplicationController

  # GET /ai_lists
  def index
    @ai_lists = current_user.ai_lists
  end

  # GET /ai_lists/new
  def new
  end

  # POST /ai_lists
  def create 
    AiList.load_data
    @movie_path = AiList.find_movie_path(params[:actor_1], params[:actor_2])
  end 

  private 

  def ai_list_params
    params.require(:ai_list).permit(:actor_1, :actor_2)
  end
end
