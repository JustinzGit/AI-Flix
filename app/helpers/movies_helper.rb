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
end
