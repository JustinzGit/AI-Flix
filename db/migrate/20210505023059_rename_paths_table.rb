class RenamePathsTable < ActiveRecord::Migration[6.0]
  def change
    rename_table :paths, :ai_movie_paths
  end
end
