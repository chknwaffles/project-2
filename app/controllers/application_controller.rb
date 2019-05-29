class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def authorize_spotify
        RSpotify.authenticate(ENV['CLIENT_ID'], ENV['SECRET_KEY'])
    end

    def current_user
        User.find_by(id: session[:user_id])
    end

    def logged_in?
        !!current_user
    end

    def index
        authorize_spotify
    end

    # def authorized
    #     #check if user has access
    # end
end
