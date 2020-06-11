class ActorsController < ApplicationController

  def index
    name = params[:search] if params[:search] && !params[:search].blank?
    birth_year = params[:date][:year] if params[:date] && !params[:date][:year].blank?

    if name
      @actors = Actor.find_by_name(params[:search])

    elsif birth_year
      @actors = Actor.find_by_birth_year(params[:date][:year])
    end

    @actors = @actors.paginate(page: params[:page], per_page: 20) if @actors
  end

  def show
    @actor = Actor.find(params[:id])
    @movies = @actor.movies
    @actor = Actor.get_actor(@actor.name)
  end
end
