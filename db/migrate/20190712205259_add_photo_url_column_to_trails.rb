class AddPhotoUrlColumnToTrails < ActiveRecord::Migration[5.2]
  def change
    add_column :trails, :photo_url, :string
  end
end
