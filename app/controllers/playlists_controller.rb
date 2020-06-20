class PlaylistsController < ApplicationController
  def index
    if session[:user_id] != params[:user_id]
      redirect_home_if_not_authorized
    else
      @playlists = User.find(params[:user_id]).playlists
    end
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.save
    redirect_to playlists_path
  end

  def show
    if session[:user_id] != params[:user_id]
      redirect_home_if_not_authorized
    else
      @playlist = Playlist.find(params[:id])
    end
  end

  def select_movie
    @movie = Movie.find(params[:movie_id])
    @playlists = current_user.playlists
  end

  def add
    movie = Movie.find(params[:movie_id])
    playlist = Playlist.find(params[:playlist_id])

    if current_user.playlists.include?(playlist)
      playlist.movies << movie
      redirect_to playlist_path(playlist)
    else
      redirect_home_if_not_authorized
    end 
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name, :user_id)
  end
end
