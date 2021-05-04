class PlaylistsController < ApplicationController

  # GET /playlists
  def index
    @playlists = current_user.playlists
  end

  # GET /playlists/new
  def new
    @playlist = Playlist.new
  end

  # POST /playlists
  def create
    @playlist = Playlist.create(playlist_params)
    redirect_to playlist_path(@playlist)
  end

  # GET /playlists/:id
  def show
    @playlist = Playlist.find(params[:id])
  end

  # GET /playlists/:id/edit
  def edit
    @playlist = Playlist.find(params[:id])
  end 

  # PATCH/PUT /playlists/:id
  def update
    @playlist = Playlist.find(params[:id])
    @playlist.update(playlist_params)
    redirect_to playlist_path(@playlist)
  end 

  def destroy
    playlist = Playlist.find(params[:id])
    redirect_if_not_authorized(current_user.playlists, playlist)

    playlist.destroy
    redirect_to user_playlists_path(current_user)
  end

  def playlist_params
    params.require(:playlist).permit(:name, :user_id, movie_ids: [])
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
    redirect_to playlist_path(playlist)
  end

  # def edit
  #   @playlist = Playlist.find(params[:id])
  #   redirect_if_not_authorized(current_user.playlists, @playlist)
  # end 

  # def remove_movie
  #   movie = Movie.find(params[:movie_id])
  #   playlist = Playlist.find(params[:playlist_id])
  #   redirect_if_not_authorized(current_user.playlists, playlist)

  #   PlaylistMovie.find_by(playlist_id: playlist.id, movie_id: movie.id).destroy 
  #   redirect_to playlist_path(playlist) 
  # end 
end


