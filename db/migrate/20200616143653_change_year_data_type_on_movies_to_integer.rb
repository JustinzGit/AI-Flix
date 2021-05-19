class ChangeYearDataTypeOnMoviesToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :movies, :year, 'integer USING CAST(birth AS integer)'
  end
end
