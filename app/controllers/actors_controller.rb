class ActorsController < ApplicationController

  def search
    name = params[:name] if params[:name] && !params[:name].blank?
    
    if name
      @actors = Actor.search(params[:name])
    end

    @actors = @actors.paginate(page: params[:page], per_page: 20) if @actors
  end

  def show
    @actor = Actor.find(params[:id])
    @movies = @actor.movies
    @actor_data = Actor.get_tmdb_data(@actor.name)
  end
end
