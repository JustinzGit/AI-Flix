class RenameColumnOnMovies < ActiveRecord::Migration[6.0]
  def change
    rename_column :movies, :image, :poster_path
  end
end
