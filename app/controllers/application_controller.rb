class ApplicationController < ActionController::Base
    helper_method :current_user
    
    def current_user
        User.find_by(id: session[:id])
    end

    def logged_in?
        !!current_user
    end

    def authorized
        #check if user has access
    end
end
