class Album < ApplicationRecord
    belongs_to :artist
    has_many :songs

    def album_rating
    	self.songs.map {|song| song.average_rating }.reduce(:+).to_f / self.songs.length.to_f
    end

    def self.top_rated_albums
        self.all.select {|album| album.album_rating if !album.album_rating.nan? }.sort_by{|album| album.average_rating }.reverse
    end
end
