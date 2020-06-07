class PlaylistsController < ApplicationController

  def new
  end

  def create
    render plain: params.inspect
    # actor_1 = params[:actor_1]
    # actor_2 = params[:actor_2]
    # @ai_results = ArtificialIntelligence.shortest_path
  end
end
