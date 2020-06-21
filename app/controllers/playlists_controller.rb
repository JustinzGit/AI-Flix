class PlaylistsController < ApplicationController
  def index
    if session[:user_id] != params[:user_id].to_i
      redirect_home_if_not_authorized
    else
      @playlists = current_user.playlists
    end
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.save
    redirect_to user_playlists_path(current_user)
  end

  def show
    if session[:user_id] != params[:user_id].to_i
      redirect_home_if_not_authorized
    else
      @playlist = Playlist.find(params[:id])
    end
  end

  def select_playlist
    @movie = Movie.find(params[:movie_id])
    @playlists = current_user.playlists
  end

  def add_movie
    movie = Movie.find(params[:movie_id])
    playlist = Playlist.find(params[:playlist_id])

    if current_user.playlists.include?(playlist)
      playlist.movies << movie
      redirect_to user_playlist_path(current_user, playlist)
    else
      redirect_home_if_not_authorized
    end 
  end

  def destroy
    playlist = Playlist.find(params[:id])
    redirect_if_not_authorized(playlist)

    playlist.destroy
    redirect_to user_playlists_path(current_user)
  end 

  private

  def playlist_params
    params.require(:playlist).permit(:name, :user_id)
  end

  def redirect_if_not_authorized(playlist)
    if !current_user.playlists.include?(playlist)
      flash[:alert] = "Playlist Doesn't Belong to You!"
      redirect_to homepage_path
    end
  end
end
