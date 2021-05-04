module PlaylistsHelper
    def display_movies_in_playlist(playlist)
        if playlist.movies.empty?
            raw("<p>No Movies</p>")
        else
            movies = playlist.movies.map do |m|
                "<p>#{link_to(m.title, movie_path(m), target: :_blank)}</p>"
            end
            raw(movies.join)  
        end
    end 
end