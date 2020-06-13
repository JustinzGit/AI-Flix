module PathsHelper

  def organize_path(playlist)
    movies = playlist.movies
    actors = playlist.actors
    string = ""

    movies.length.times do |i|
      string += "#{actors[i].name} and #{actors[i + 1].name} starred in #{movies[i].title}<br>"
    end
    string.html_safe
  end

  def actor_1_name
    session[:actor_1]['name'] if session[:actor_1]
  end

  def actor_2_name
    session[:actor_2]['name'] if session[:actor_2]
  end

  def playlist_actor_link(actor)
    if actor_1_name.nil?
      playlist_actor_1_path(actor)
    else
      playlist_actor_2_path(actor)
    end
  end
end
