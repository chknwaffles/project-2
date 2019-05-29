class Song < ApplicationRecord
    belongs_to :album
    belongs_to :artist
    has_many :ratings

    def average_rating
        self.ratings.map {|rating| rating.stars }.reduce(:+).to_f / self.ratings.length.to_f
    end
end
