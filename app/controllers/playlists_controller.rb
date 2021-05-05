class PlaylistsController < ApplicationController

  # GET /playlists
  def index
    @playlists = current_user.playlists
  end

  # GET /playlists/:id
  def show
    @playlist = Playlist.find(params[:id])
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

  # GET /playlists/:id/edit
  def edit
    @playlist = Playlist.find(params[:id])
  end 

  # PATCH/PUT /playlists/:id
  def update
    binding.pry
    @playlist = Playlist.find(params[:id])
    @playlist.update(playlist_params)
    redirect_to playlist_path(@playlist)
  end 

  # DELETE /playlists/:id
  def destroy
    @playlist = Playlist.find(params[:id])
    @playlist.destroy
    redirect_to playlists_path(@playlist)
  end

  def playlist_params
    params.require(:playlist).permit(:name, :user_id, movie_ids: [])
  end
end