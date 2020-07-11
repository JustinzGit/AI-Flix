class MoviesController < ApplicationController

  def search
    if params[:title] && !params[:title].blank?
      @movies = Movie.search(params[:title])
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actors
    @movie_data = Movie.get_tmdb_data(@movie.title)
  end
end
