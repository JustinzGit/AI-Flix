class ChangeColumnNames < ActiveRecord::Migration[6.0]
  def change
    rename_column :actors, :IMBD_ID, :tmdb_id
    rename_column :movies, :IMBD_ID, :tmdb_id
  end
end
