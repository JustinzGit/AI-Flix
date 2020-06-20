module MoviesHelper
    def movie_date(movie)
        format_date(@movie[:release_date])
    end 
end
