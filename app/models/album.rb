class Album < ApplicationRecord
    belongs_to :artist
    has_many :songs

    def load_songs
        new_album = RSpotify::Album.find(self.spotify_id)
        new_album.tracks.each do |track|
            new_song = Song.find_or_create_by(name: track.name, spotify_id: track.id)
            new_song.update(artist_id: self.artist.id, album_id: self.id)
        end
    end

    def album_rating
        rated_songs = self.songs.select {|song| song.average_rating if !song.ratings.empty? }
        rated_songs.map {|song| song.average_rating }.reduce(:+).to_f / rated_songs.length.to_f
    end

    def self.top_rated_albums
        self.all.select do |album|
            album.album_rating if !album.album_rating.nan?
        end.sort_by {|album| album.album_rating }.reverse
    end
end
