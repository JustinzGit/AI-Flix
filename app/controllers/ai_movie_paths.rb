class AiMoviePathsController < ApplicationController

  def index
    @paths = current_user.paths
  end

  def new
    if params[:name] && !params[:name].blank?
      @actors = Actor.search(params[:name])
    end
  end

  def actor_1
    session[:actor_1] ||= Actor.find(params[:actor_1])
    redirect_to new_user_path_path(current_user)
  end

  def actor_2
    session[:actor_2] ||= Actor.find(params[:actor_2])
    redirect_to new_user_path_path(current_user)
  end

  def clear_actor_names
    session[:actor_1] = nil
    session[:actor_2] = nil
    redirect_to new_user_path_path(current_user)
  end

  def create
    # Acquire actor names from session hash
    actor_1 = Actor.find(session[:actor_1]['id'])
    actor_2 = Actor.find(session[:actor_2]['id'])

    # Name path using actor names
    name = "#{actor_1.name} and #{actor_2.name} Path"

    # Generate path of movies that link the two actors
    shortest_path = Search.shortest_path(actor_1.id, actor_2.id)

    if shortest_path.nil?
      flash[:alert] = "{ Actors Can Not Be Connected }"
      redirect_to new_user_path_path(current_user)
    else
      @path = Path.new(name: name, user_id: session[:user_id])

      @path.movies << shortest_path[:movies]
      @path.actors << shortest_path[:actors]

      @path.save

      redirect_to user_path_path(current_user, @path)
    end
  end

  def show
    @path = Path.find(params[:id])
    redirect_if_not_authorized(current_user.paths, @path)
  end

  def destroy
    path = Path.find(params[:id])
    redirect_if_not_authorized(current_user.paths, path)
    
    path.destroy
    redirect_to homepage_path
  end
end
