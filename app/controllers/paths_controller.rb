class PathsController < ApplicationController

  def index
    @paths = current_user.paths
  end

  def new
    actor_name = params[:name] if params[:name] && !params[:name].blank?
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
    redirect_to new_path_path
  end

  def actor_2
    session[:actor_2] ||= Actor.find(params[:actor_2])
    redirect_to new_path_path
  end

  # This action clears actors names from session
  # Should use JavaScript in future
  def clear_actor_names
    session[:actor_1] = nil
    session[:actor_2] = nil
    redirect_to new_path_path
  end

  def create
    # Acquire actor names from path form
    actor_1 = Actor.find(session[:actor_1]['id'])
    actor_2 = Actor.find(session[:actor_2]['id'])

    # Name path using actor names
    name = "#{actor_1.name} and #{actor_2.name} Path"

    # Generate path of movies that link the two actors
    shortest_path = Search.shortest_path(actor_1.id, actor_2.id)

    if shortest_path.nil?
      flash[:alert] = "{ Actors Can Not Be Connected }"
      redirect_to new_path_path
    else
      @path = Path.new(name: name, user_id: session[:user_id])

      @path.movies << shortest_path[:movies]
      @path.actors << shortest_path[:actors]

      @path.save

      redirect_to path_path(@path)
    end
  end

  def show
    @path = Path.find(params[:id])
    redirect_if_not_authorized(@path)
  end

  def destroy
    path = Path.find(params[:id])
    if current_user.paths.include?(path)
      path.destroy
      redirect_to homepage_path
    else
      redirect_home_if_not_authorized
    end 
  end
end
