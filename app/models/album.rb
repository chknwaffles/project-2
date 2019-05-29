class Album < ApplicationRecord
    belongs_to :artist
    has_many :songs

    def album_rating
        rated_songs = self.songs.select {|song| song.average_rating if !song.average_rating.nan? }
        rated_songs.map {|song| song.average_rating }.reduce(:+).to_f / rated_songs.length.to_f
    end

    def self.top_rated_albums
        self.all.select do |album|
            album.album_rating if !album.album_rating.nan?
        end.sort_by {|album| album.album_rating }.reverse
    end
end
