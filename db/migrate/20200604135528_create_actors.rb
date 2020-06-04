class CreateActors < ActiveRecord::Migration[6.0]
  def change
    create_table :actors do |t|
      t.integer :IMBD_ID
      t.string :name
      t.string :birth

      t.timestamps
    end
  end
end
