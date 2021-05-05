class RemovePathActors < ActiveRecord::Migration[6.0]
  def change
    drop_table :path_actors
  end
end
