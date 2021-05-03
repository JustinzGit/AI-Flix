class ActorsController < ApplicationController

  # GET /actors/search
  def search
    @actors = Actor.search_by_name(params[:name])
  end

  def show
    @actor = Actor.find(params[:id])
    @movies = @actor.movies
    @actor_data = Actor.get_tmdb_data(@actor.name)
  end
end
