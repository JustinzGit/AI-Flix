class ActorsController < ApplicationController

  # GET /actors/search
  def search
    @actors = Actor.search_by_name(params[:query])
  end

  # GET /actors/:id (tmdb id)
  def show
    @actor = Actor.find(params[:id])
    @actor.fetch_tmdb_data
  end
end
