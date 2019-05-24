class ApplicationController < ActionController::Base
	helper_method :get_api_request

	def get_api_request(landmark)
		RestClient.get("https://en.wikipedia.org/w/api.php?action=opensearch&search=#{landmark}i&limit=10&namespace=0&format=json")
	end

end
