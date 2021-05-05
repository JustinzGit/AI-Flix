module AiListsHelper

  def reveal_path(path)
    movies = path.movies
    actors = path.actors
    string = ""

    movies.length.times do |i|
      string += "<p>#{actors[i].name} and #{actors[i + 1].name} starred in #{movies[i].title}</p>"
    end
    string.html_safe
  end

  def actor_1_name
    session[:actor_1]['name'] if session[:actor_1]
  end

  def actor_2_name
    session[:actor_2]['name'] if session[:actor_2]
  end

  def actor_action(actor)
    if actor_1_name.nil?
      actor_1_path(actor)
    else
      actor_2_path(actor)
    end
  end

  def display_users_lists(ai_lists)
    if ai_lists
      lists = ai_lists.map do |list|
        "<p>#{link_to(list.name, ai_list_path(list))}</p>"
      end
      raw(lists.join) 
    end 
  end 
end
