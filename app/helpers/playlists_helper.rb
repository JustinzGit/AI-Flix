module PlaylistsHelper
    def display_movies_in_playlist(playlist)
        if playlist.movies.empty?
            raw("<h2 class='white-heading'>No Movies Added</h2>")
        else
            movies = playlist.movies.map do |m|
                "#{link_to(m.title, movie_path(m), target: :_blank, class: "grey-link")}"
            end
            raw(movies.join)  
        end
    end 
end