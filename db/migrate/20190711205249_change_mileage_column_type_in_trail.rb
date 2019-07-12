class ChangeMileageColumnTypeInTrail < ActiveRecord::Migration[5.2]
  def change
    change_column :trails, :miles, :float
    change_column :trails, :elevation_gain, :string
  end
end
