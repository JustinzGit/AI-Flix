class CreatePaths < ActiveRecord::Migration[6.0]
  def change
    create_table :paths do |t|
      t.string :name
      t.string :category
      t.integer :user_id
    end
  end
end
