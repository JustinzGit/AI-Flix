class RemovePathMovies < ActiveRecord::Migration[6.0]
  def change
    drop_table :path_movies
  end
end
