class ChangePlaylistActorsToPathActors < ActiveRecord::Migration[6.0]
  def change
    rename_table :playlist_actors, :path_actors
  end
end
