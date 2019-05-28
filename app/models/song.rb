class Song < ApplicationRecord
    belongs_to :album
    belongs_to :artist
    has_many :ratings
end
