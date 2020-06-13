class ChangePlaylistMoivesToPathMovies < ActiveRecord::Migration[6.0]
  def change
    rename_table :playlist_movies, :path_movies
  end
end
