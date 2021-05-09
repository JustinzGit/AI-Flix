class AddImageAndPopularityColumnsToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :popularity, :float
    add_column :movies, :backdrop_path, :string
  end
end
