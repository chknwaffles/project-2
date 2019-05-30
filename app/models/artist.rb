class Artist < ApplicationRecord
    has_many :songs
    has_many :albums
    has_many :ratings, through: :songs

    def load_albums(artist_hash)
        artist_hash.albums.each do |album|
            if album.available_markets.include?('US')
                new_album = Album.find_or_create_by(name: album.name)
                new_album.update(image_url: album.images[1]["url"], artist_id: self.id, spotify_id: album.id)
            end
        end
    end

    def load_all_songs
        Album.all.each do |album|
            album.load_songs
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
