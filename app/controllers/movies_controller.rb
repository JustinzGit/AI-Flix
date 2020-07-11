class MoviesController < ApplicationController

  def search
    title = params[:title] if params[:title] && !params[:title].blank?

    if title
      @movies = Movie.search(title)
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actors
    @movie_data = Movie.get_tmdb_data(@movie.title)
  end
end
