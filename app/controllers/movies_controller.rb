class MoviesController < ApplicationController

  # GET /movies/search
  def search
      @movies = Movie.search_by_title(params[:query])
  end

  # GET /movies/:id (tmdb id)
  def show
    @movie = Movie.find(params[:id])
    @movie.fetch_tmdb_data
  end
end
