class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.all.where(user_id: session[:user_id])
  end

  def new
  end

  def create
    # Acquire actor names from playlist form
    actor_1 = Actor.find(params[:actor_1])
    actor_2 = Actor.find(params[:actor_2])

    # Name playlist using actor names
    name = "#{actor_1.name} and #{actor_2.name} Playlist"

    # Generate playlist of movies that link the two actors
    path = Search.shortest_path(actor_1, actor_2)

    @playlist = Playlist.new(name: name, user_id: session[:user_id])

    # Store results from algorithm to playlist
    @playlist.movies << path[:movies]
    @playlist.actors << path[:actors]
    @playlist.save

    redirect_to playlist_path(@playlist)
  end

  def show
    @playlist = Playlist.find(params[:id])
  end
end
