class MoviesController < ApplicationController

  def index
    if params[:search] && !params[:search].empty?
      @movies = Movie.begins_with(params[:search]).paginate(page: params[:page], per_page: 20)
    end

    if params[:date] && !params[:date][:year].empty?
      @movies = Movie.released_in(params[:date][:year]).paginate(page: params[:page], per_page: 20)
    end

  end

  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actors
    @movie = Movie.get_movie(@movie.title)
  end
end
