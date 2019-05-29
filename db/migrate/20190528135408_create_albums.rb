class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :name
      t.string :image_url
      t.integer :artist_id
      t.string :spotify_id
      t.timestamps
    end
  end
end
