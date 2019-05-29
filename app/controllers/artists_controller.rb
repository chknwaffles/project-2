class ArtistsController < ApplicationController
    def search_artist
        artist_hash = RSpotify::Artist.search(params[:search])
        @artist = Artist.find_or_create_by(name: artist_hash.first.name, spotify_id: artist_hash.first.id, image_url: artist_hash.first.images[1]["url"])
        @artist.create_all(artist_hash.first)
        redirect_to @artist
    end

    def show
        @artist = Artist.find(params[:id])
    end
end

