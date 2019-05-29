class ArtistsController < ApplicationController
    def search_artist
        @artist_hash = RSpotify::Artist.search(params[:search])
        render :results
    end

    def create
    	@artist = Artist.find_or_create_by(name: params[:name], spotify_id: params[:spotify_id])
   		spotify_artist = RSpotify::Artist.find(@artist.spotify_id)
   		if !spotify_artist.images.nil?
   			@artist.update(image_url: spotify_artist.images[1]["url"])
   			byebug
   		end

   		@artist.create_all(spotify_artist)
   		redirect_to artist_path(@artist)
    end

    def show
        @artist = Artist.find(params[:id])
    end
end

