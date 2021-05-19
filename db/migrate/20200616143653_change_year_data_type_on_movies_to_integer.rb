class ChangeYearDataTypeOnMoviesToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :movies, :year, 'integer USING CAST(year AS integer)'
  end
end
