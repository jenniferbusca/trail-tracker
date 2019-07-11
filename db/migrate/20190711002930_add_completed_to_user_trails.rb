class AddCompletedToUserTrails < ActiveRecord::Migration[5.2]
  def change
     add_column :user_trails, :completed, :string
  end
end
