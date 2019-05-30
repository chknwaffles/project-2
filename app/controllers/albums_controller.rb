class AlbumsController < ApplicationController
    def show
        @album = Album.find(params[:id])
        @album.load_songs
    end
end
