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
end
