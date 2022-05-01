# logout controller; extends application controller 
class LogoutController < ApplicationController
    # will render logout page
    def logout
       # clear session of username and type
       session[:type] = nil
       session[:current_username] = nil
       redirect_to(homepage_path) # redirect to homepage as signed out
    end
end