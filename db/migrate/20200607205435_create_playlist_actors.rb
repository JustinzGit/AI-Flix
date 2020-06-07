class CreatePlaylistActors < ActiveRecord::Migration[6.0]
  def change
    create_table :playlist_actors do |t|
      t.integer :playlist_id
      t.integer :actor_id
    end
  end
end
