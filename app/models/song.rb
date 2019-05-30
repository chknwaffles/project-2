class Song < ApplicationRecord
    belongs_to :album
    belongs_to :artist
    has_many :ratings

    def average_rating
        if !self.ratings.empty?
            self.ratings.map {|rating| rating.stars }.reduce(:+).to_f / self.ratings.length.to_f
        else
            Float::NAN
        end
    end

    def self.top_rated_songs
        Song.all.select do |song|
            song.average_rating if !song.average_rating.nan?
        end.sort_by {|song| song.average_rating }.reverse
    end

    def music_url
        song = RSpotify::Track.find(self.spotify_id)
        song.preview_url

        # if song.preview_url == nil
        #     song = RSpotify::Track.search(self.name, market: 'US')
        #     song.preview_url
        # end
    end
end
