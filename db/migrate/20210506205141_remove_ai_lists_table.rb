class RemoveAiListsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :ai_lists
  end
end
