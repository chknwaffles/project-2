class Artist < ApplicationRecord
    has_many :songs
    has_many :albums
    has_many :ratings, through: :songs

    def create_all(artist_hash)
        byebug
        artist_hash.albums.each do |album|
            new_album = Album.find_or_create_by(name: album.name)
            new_album.update(image_url: album.images[1]["url"], artist_id: self.id, spotify_id: album.id)
            album.tracks.each do |track|
                new_song = Song.find_or_create_by(name: track.name)
                new_song.update(artist_id: self.id, album_id: new_album.id, spotify_id: track.id)
            end
        end
    end

    def avg_rating
        total_rating = 0.0
        self.songs.each do |song|
            if !song.average_rating.nan?
                total_rating += song.average_rating
            end
        end

        total_rating / self.ratings.length.to_f
    end
end
