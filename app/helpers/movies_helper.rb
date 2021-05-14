module MoviesHelper
    def movie_date(movie)
        format_date(movie[:release_date])
    end
    
    def movie_budget(movie)
        number_to_currency(movie[:budget])
    end 

    def movie_profit(movie)
        number_to_currency(movie[:revenue])
    end

    def display_movies_search_results(results)
        if results
            count = "<h3 class='list-title'>We found #{results.count} Movies</h3>"
            movies = results.map do |m|
                "<p>#{link_to(m.title, movie_path(m))}</p>"
            end
            raw(count + movies.join) 
        end
    end 

    def display_movie_reviews(reviews)
        if !reviews.empty?
            reviews = reviews.map do |r|
                review = "<p>#{r.user.username} Says: #{r.user_review}</p>"
                if r.user_id == current_user.id
                    button = button_to("Remove Review", review_path(r), method: :delete)
                    review + button
                else 
                    review
                end 
            end
            raw(reviews.join) 
        end 
    end 

    def display_most_popular(movie)
        top_movie_stats =
            """
            <h2 class='movie-title'>#{movie.title}</h2>
            #{"<h3 class='tagline'>#{movie.tagline}</h3>" if movie.tagline != ""}
            <p>Popularity Score<br>#{movie.popularity}</p>
            #{"<p>Budget<br>#{movie.budget}</p>" if movie.budget != "0"}
            #{"<p>Revenue<br>#{movie.revenue}</p>" if movie.budget != "0"}
            #{link_to("Learn More", movie_path(movie), class: "link")}
            """
        raw(top_movie_stats)
    end
    
    def display_movies(movies)
        movies = movies[1...-1].map do |m|
            """
            <div class='movie-card'>
                #{image_tag("https://image.tmdb.org/t/p/original#{m.poster_path}", 
                sizes: "100vw", loading: "lazy", class: "small-movie-image")}
              
                <div class='small-movie-text'>Popularity Score <br> #{m.popularity}</div>
            </div>
            """
        end
        raw(movies.join)
    end 
end
