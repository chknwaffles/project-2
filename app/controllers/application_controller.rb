class ApplicationController < ActionController::Base

    helper_method :current_user


        RSpotify.authenticate(ENV['CLIENT_ID'], ENV['SECRET_KEY'])

    def current_user
        User.find_by(id: session[:user_id])
    end

    def logged_in?
        !!current_user
    end

    # def authorized
    #     #check if user has access
    # end
	# helper_method :get_api_request

	# def get_api_request(landmark)
	# 	RestClient.get("https://en.wikipedia.org/w/api.php?action=opensearch&search=#{landmark}i&limit=10&namespace=0&format=json")
	# end

end
