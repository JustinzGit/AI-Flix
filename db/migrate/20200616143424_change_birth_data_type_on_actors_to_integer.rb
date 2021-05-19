class ChangeBirthDataTypeOnActorsToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :actors, :birth, 'integer USING CAST(birth AS integer)'
  end
end
