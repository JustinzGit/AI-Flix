module AiRoutesHelper

  def reveal_path(path)
    movies = path.movies
    actors = path.actors
    string = ""

    movies.length.times do |i|
      string += "<p>#{actors[i].name} and #{actors[i + 1].name} starred in #{movies[i].title}</p>"
    end
    string.html_safe
  end
    
  def display_actor_selection(results)
    if results
        count = "<h3 class='list-title'>We found #{results.count} Actors</h3>"
        actors = results.map do |a|
            "<div id='#{a.id}'>#{a.name}</div><br>"
        end
        raw(count + actors.join) 
    end
end 
end
