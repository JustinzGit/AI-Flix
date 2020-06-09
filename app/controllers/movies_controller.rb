class MoviesController < ApplicationController
  def index
    @movies = Movie.all.order('title')
  end

  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actors
    @movie = Movie.get_movie(@movie.title)
  end
end
