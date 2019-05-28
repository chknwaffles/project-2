class SongsController < ApplicationController
    def index
        @artist = Artist.find(params[:artist_id])
    end

    def show
        @song = Song.find(params[:id])
        @rating = Rating.new
    end
end
