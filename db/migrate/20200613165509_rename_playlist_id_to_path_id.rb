class RenamePlaylistIdToPathId < ActiveRecord::Migration[6.0]
  def change
    rename_column :path_actors, :playlist_id, :path_id
    rename_column :path_movies, :playlist_id, :path_id
  end
end
