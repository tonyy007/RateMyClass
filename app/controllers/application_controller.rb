class ApplicationController < ActionController::Base
    def routing_error(error = 'Routing error', status = :not_found, exception=nil)
        flash[:notice] = "Invalid Path"
        redirect_to(homepage_path)
    end
end
