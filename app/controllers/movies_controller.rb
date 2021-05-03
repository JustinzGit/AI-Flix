class MoviesController < ApplicationController

  # GET /movies/search
  def search
      @movies = Movie.search_by_title(params[:query])
  end

  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actors
    @movie_data = Movie.get_tmdb_data(@movie.title)
  end
end
