class Artist < ApplicationRecord
    has_many :songs
    has_many :albums
    has_many :ratings, through: :songs

    def create_all(artist_hash)
        artist_hash.albums.each do |album|
            new_album = Album.create(name: album.name, image_url: album.images[1]["url"], artist_id: self.id)
            album.tracks.each do |track|
                Song.create(name: track.name, artist_id: self.id, album_id: new_album.id)
            end
        end
    end
end
