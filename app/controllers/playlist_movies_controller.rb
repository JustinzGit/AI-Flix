class PlaylistMoviesController < ApplicationController

    # POST /playlist_movies
    def create
        @playlist_movie = PlaylistMovie.create(playlist_movie_params)
        redirect_to playlist_path(@playlist_movie.playlist)
    end 

    private 
    
    def playlist_movie_params
        params.require(:playlist_movie).permit(:playlist_id, :movie_id)
    end
end
