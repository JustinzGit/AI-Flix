class CreatePlaylistMoviesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :playlist_movies_tables do |t|
      t.integer :playlist_id
      t.integer :movie_id
    end
  end
end
