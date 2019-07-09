class CreateTrails < ActiveRecord::Migration[5.2]
  def change
    create_table :trails do |t|
      t.string :name
      t.string :location
      t.integer :miles
      t.integer :elevation_gain
      t.string :difficulty
    end
  end
end
