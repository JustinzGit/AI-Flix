module MoviesHelper
    def movie_date(movie)
        format_date(movie[:release_date])
    end
    
    def movie_budget(movie)
        number_to_currency(movie[:budget])
    end 
end
