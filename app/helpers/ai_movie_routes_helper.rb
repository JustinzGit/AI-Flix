module AiMovieRoutesHelper

  def display_movie_path(path)
    html = []
    movie_count = path[:movies].length

    movie_count.times.map do |index|
      index % 2 == 0 ? orientation = "right" : orientation = "left"
      html << """
        <div class='actors-section connection-#{orientation}'>
          <div class='actor-right w-container'>

              #{
                if orientation == "right"
                  "<div class='actor-wrapper'>
                   <h3 class='title-heading'>#{path[:actors][index][:name]}</h3>
                   #{link_to(image_tag("https://image.tmdb.org/t/p/original#{path[:actors][index][:image]}", class: "show-image small"), 
                      actor_path(path[:actors][index][:id]), target: :blank, class: "ai-route-link")}"
                else 
                  "<div class='actor-wrapper left with-connection'>
                   <h3 class='title-heading'>#{path[:actors][index + 1][:name]}</h3>
                   #{link_to(image_tag("https://image.tmdb.org/t/p/original#{path[:actors][index + 1][:image]}", class: "show-image small"), 
                      actor_path(path[:actors][index + 1][:id]), target: :blank, class: "ai-route-link")}"
                end 
              }
            
              #{
                if orientation == "left"
                  "<div class='line-div' #{"style='visibility: hidden'" if index + 1 == movie_count} ><div class='line vertical right'></div></div>"
                end 
              }
              
            </div>

            <div class='circle'></div>
          </div>

          <div class='circle single'></div>

          <div class='path-connector'>
            <h3 class='title-heading'>Starred In</h3>
            <div class='line horizontal'></div>
            <div class='line vertical'></div>
          </div>

          <div class='actor-left w-container'>
            <div class='circle'></div>

            #{
              if orientation == "right"
                "<div class='actor-wrapper right with-connection'>
                 <h3 class='title-heading'>#{path[:actors][index + 1][:name]}</h3>
                 #{link_to(image_tag("https://image.tmdb.org/t/p/original#{path[:actors][index + 1][:image]}", class: "show-image small"), 
                    actor_path(path[:actors][index + 1][:id]), target: :blank, class: "ai-route-link")}"
              else 
                "<div class='actor-wrapper'>
                <h3 class='title-heading'>#{path[:actors][index][:name]}</h3>
                #{link_to(image_tag("https://image.tmdb.org/t/p/original#{path[:actors][index][:image]}", class: "show-image small"), 
                    actor_path(path[:actors][index][:id]), target: :blank, class: "ai-route-link")}"
              end 
              }
              #{
                if orientation == "right"
                  "<div class='line-div' #{"style='visibility: hidden'" if index + 1 == movie_count} ><div class='line vertical right'></div></div>"
                end 
              }
            </div>
          </div>
        </div>

        <h1 class='white-heading small'>Starred In </h1>
        <div class='movies-section'>
          <div class='movie-wrapper'>
            <div class='circle margin-bottom'></div>
            <h3 class='title-heading'>#{path[:movies][index][:title]}</h3>
            #{link_to(image_tag("https://image.tmdb.org/t/p/original#{path[:movies][index][:poster_path]}", class: "show-image small"), 
                movie_path(path[:movies][index]), target: :blank, class: "ai-route-link")}
          </div>
        </div>
      """
    end
    raw(html.join) 
  end 

  def display_actor_search_results(results)
    if results && !results.empty?
        actors = results.map do |a|
            "<div id='#{a.id}' class='grey-text-block'>#{a.name}</div>"
        end
        raw(actors.join) 
    elsif results && results.empty?
      raw("<h1 class='red-heading'>No Actors Found</h1>")
    end
end 
end
