class DeleteColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :actors, :birth
    remove_column :movies, :year
    remove_column :paths, :category
  end
end
