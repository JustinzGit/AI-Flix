class AddColumnsToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :budget, :string
    add_column :movies, :revenue, :string
    add_column :movies, :overview, :string
    add_column :movies, :image, :string
    add_column :movies, :release_date, :string
    add_column :movies, :tagline, :string
    add_column :movies, :imdb_id, :string
    add_column :movies, :data_collected, :boolean, :default => false
  end
end
