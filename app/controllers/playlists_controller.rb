class PlaylistsController < ApplicationController

  # Before action - require login applied to all 

  def index
    @playlists = current_user.playlists
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
    @playlist = Playlist.find_by(id: params[:id])
    redirect_if_not_authorized(current_user.playlists, @playlist)
  end

  def select_playlist
    @movie = Movie.find(params[:movie_id])
    @playlists = current_user.playlists
  end

  def add_movie
    playlist = Playlist.find(params[:playlist_id])
    movie = Movie.find(params[:movie_id])

    redirect_if_not_authorized(current_user.playlists, playlist)
    
    playlist.movies << movie
    redirect_to user_playlist_path(current_user, playlist)
  end

  def edit
    @playlist = Playlist.find(params[:id])

    if !current_user.playlists.include?(@playlist)
      flash[:alert] = "Playlist Doesn't Belong to You!"
      redirect_to homepage_path
    end 
  end 

  def remove_movie
    movie = Movie.find(params[:movie_id])
    playlist = Playlist.find(params[:playlist_id])

    PlaylistMovie.find_by(playlist_id: playlist.id, movie_id: movie.id).destroy 
    redirect_to user_playlist_path(current_user, playlist) 
  end 

  def update
    @playlist = Playlist.find(params[:id])
    @playlist.update(playlist_params)
    redirect_to user_playlist_path(current_user, @playlist)
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
end
