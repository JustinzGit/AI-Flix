class PlaylistsController < ApplicationController

  def new
    actor_name = params[:search] if params[:search] && !params[:search].blank?
    birth_year = params[:date][:year] if params[:date] && !params[:date][:year].blank?

    if actor_name && birth_year
      @actors = Actor.find_actors(actor_name, birth_year)

    elsif actor_name
      @actors = Actor.find_by_name(actor_name)

    elsif birth_year
      @actors = Actor.find_by_birth_year(params[:date][:year])
    end

    @actors = @actors.paginate(page: params[:page], per_page: 20) if @actors
  end

  def actor_1
    session[:actor_1] ||= Actor.find(params[:actor_1])
    redirect_to new_playlist_path
  end

  def actor_2
    session[:actor_2] ||= Actor.find(params[:actor_2])
    redirect_to new_playlist_path
  end

  def clear_actors
    session[:actor_1] = nil
    session[:actor_2] = nil
    redirect_to new_playlist_path
  end

  def create
    # Acquire actor names from playlist form
    actor_1 = Actor.find(session[:actor_1]['id'])
    actor_2 = Actor.find(session[:actor_2]['id'])

    # Name playlist using actor names
    name = "#{actor_1.name} and #{actor_2.name} Playlist"

    # Generate playlist of movies that link the two actors
    path = Search.shortest_path(actor_1, actor_2)

    if path.nil?
      flash[:alert] = "{ Actors Can Not Be Connected }"
      redirect_to new_playlist_path
    else
      @playlist = Playlist.new(name: name, user_id: session[:user_id])

      # Store results from algorithm to playlist
      @playlist.movies << path[:movies]
      @playlist.actors << path[:actors]
      @playlist.save

      redirect_to playlist_path(@playlist)
    end
  end

  def show
    @playlist = Playlist.find(params[:id])
    redirect_if_not_authorized(@playlist)
  end

  def destroy
    Playlist.find(params[:id]).destroy
    redirect_to playlists_path
  end

  private

  def redirect_if_not_authorized(playlist)
    if !current_user.playlists.include?(playlist)
      flash[:alert] = "Playlist Not Found"
      redirect_to playlists_path
    end
  end
end
