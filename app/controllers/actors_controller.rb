class ActorsController < ApplicationController

  def index
    if params[:search] && !params[:search].empty?
      @actors = Actor.find_by_name(params[:search]).paginate(page: params[:page], per_page: 20)
    end

    if params[:date] && !params[:date][:year].empty?
      @actors = Actor.find_by_birth_year(params[:date][:year]).paginate(page: params[:page], per_page: 20)
    end
  end

  def show
    @actor = Actor.find(params[:id])
    @movies = @actor.movies
    @actor = Actor.get_actor(@actor.name)
  end
end
