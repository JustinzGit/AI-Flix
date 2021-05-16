module AiMovieRoutesHelper

  def display_movie_path(movie_path)


    movies = movie_path[:movies].map {|m| m.title}
    actors = movie_path[:actors].map {|a| a.name}
    path = []



    movies.length.times do |i|
      path << "<p>#{actors[i]} and #{actors[i + 1]} starred in #{movies[i]}</p>"
    end
    raw(path.join)
  end

  def display_actor_search_results(results)
    if results
        count = "<h1 class='red-heading small'>We found #{results.count} Actors</h1>"
        actors = results.map do |a|
            "<div id='#{a.id}' class='grey-text-block'>#{a.name}</div>"
        end
        raw(count + actors.join) 
    end
end 
end
