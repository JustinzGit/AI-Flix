module AiRoutesHelper

  def display_movie_path(movie_path)


    movies = movie_path[:movies].map {|m| m.title}
    actors = movie_path[:actors].map {|a| a.name}
    path = []



    movies.length.times do |i|
      path << "<p>#{actors[i]} and #{actors[i + 1]} starred in #{movies[i]}</p>"
    end
    raw(path.join)
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
