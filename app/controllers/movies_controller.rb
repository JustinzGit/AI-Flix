class MoviesController < ApplicationController

  def search
    title = params[:title] if params[:title] && !params[:title].blank?
    year = params[:date][:year] if params[:date] && !params[:date][:year].blank?

    if title && year
      @movies = Movie.find_movies(title, year)
    elsif title
      @movies = Movie.begins_with(title)
    elsif year
      @movies = Movie.released_in(year)
    end

    @movies = @movies.paginate(page: params[:page], per_page: 20) if @movies
  end

  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actors
    @movie_data = Movie.get_tmdb_data(@movie.title)
  end
end
