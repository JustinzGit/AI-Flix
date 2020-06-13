class PlaylistsController < ApplicationController
  def index
    @playlists = current_user.playlists
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
    @playlist = Playlist.find(params[:id])
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name, :user_id)
  end
end
