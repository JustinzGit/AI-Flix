class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :edit, :update, :destroy]
  before_action :check_playlist_ownership, only: [:show, :edit, :update, :destroy]

  # GET /playlists
  def index
    @playlists = current_user.playlists
  end

  # GET /playlists/:id
  def show
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
  end 

  # PATCH/PUT /playlists/:id
  def update
    @playlist.update(playlist_params)
    redirect_to playlist_path(@playlist)
  end 

  # DELETE /playlists/:id
  def destroy
    @playlist.destroy
    redirect_to playlists_path(@playlist)
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name, :user_id, movie_ids: [])
  end

  def set_playlist
    @playlist = Playlist.find(params[:id])
  end
  
  def check_playlist_ownership
    if !current_user.playlists.include?(@playlist)
        redirect_to playlists_path
    end 
  end 
end