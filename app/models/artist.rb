class Artist < ApplicationRecord
    has_many :songs
    has_many :albums
    has_many :ratings, through: :songs

    def create_all(spotify)
        spotify.albums.each do |album|
            Album.create(name: album.name, artist_id: self.id)
            album.tracks.each do |track|
                Song.create(name: track.name, artist_id: self.id)
            end
        end
    end
end
