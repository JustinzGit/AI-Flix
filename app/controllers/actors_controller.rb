class ActorsController < ApplicationController

  def search
    if params[:name] && !params[:name].blank?
      @actors = Actor.search(params[:name])
    end
  end

  def show
    @actor = Actor.find(params[:id])
    @movies = @actor.movies
    @actor_data = Actor.get_tmdb_data(@actor.name)
  end
end
