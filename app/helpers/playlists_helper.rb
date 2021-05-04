module PlaylistsHelper
    def display_movies_in_playlist(playlist)
        if playlist.movies.empty?
            raw("<p>No Movies Have Been Added</p>")
        else
            movies = playlist.movies.map do |m|
                "<p>#{link_to(m.title, movie_path(m), target: :_blank)}&nbsp &nbsp#{link_to('Remove', remove_movie_path(@playlist, m))}</p>"
            end
            raw(movies.join)  
        end
    end 
end