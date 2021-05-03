class AddColumnsToActors < ActiveRecord::Migration[6.0]
  def change
    add_column :actors, :birthday, :string
    add_column :actors, :deathday, :string
    add_column :actors, :biography, :string
    add_column :actors, :birthplace, :string
    add_column :actors, :image, :string
    add_column :actors, :imdb_id, :string
    add_column :actors, :data_collected, :boolean, :default => false
  end
end
