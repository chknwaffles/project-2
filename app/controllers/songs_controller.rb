class SongsController < ApplicationController
    def index
        @artist = Artist.find(params[:artist_id])
        
    end

    def show
        @song = Song.find(params[:id])
        @song_array = song_search(@song.spotify_id)

        @rating = Rating.exists?(song_id: @song.id) ? Rating.find_by(song_id: @song.id) : Rating.new
        # if Rating.exists?(song_id: @song.id)
        #     @rating = Rating.find_by(song_id: @song.id)
        # else
        #     @rating = Rating.new
        # end
    end

    def post_rating
        @song = Song.find(params[:rating][:song_id])
        @rating = Rating.create(stars: params[:rating][:stars], song_id: @song.id, user_id: current_user.id)

        redirect_to artist_song_path(@song.artist.id, @song)
    end

    def edit_rating
        @song = Song.find(params[:rating][:song_id])
        @rating = Rating.find_by(song_id: @song.id)
        @rating.update(stars: params[:rating][:stars])
        redirect_to artist_song_path(@song.artist.id, @song)

    end

    def song_search(id)
        RSpotify::Track.find(id)
    end
end
