class CreateUserTrails < ActiveRecord::Migration[5.2]
  def change
    create_table :user_trails do |t|
      t.datetime :date
      t.integer :user_id
      t.integer :trail_id
      t.string :favorite
      t.string :duration
    end
  end
end
