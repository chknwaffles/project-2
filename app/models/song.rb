class Song < ApplicationRecord
    belongs_to :album
    belongs_to :artist
    has_many :ratings

    def average_rating
        self.ratings.map {|rating| rating.stars }.reduce(:+).to_f / self.ratings.length.to_f
    end

    def self.top_rated_songs
        Song.all.select do |song|
            song.average_rating if !song.ratings.empty?
        end.sort_by {|song| song.average_rating }.reverse.first(8)
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
