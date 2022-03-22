class LogoutController < ApplicationController
    def logout
       session[:type] = nil
       session[:current_username] = nil
       #redirect_to(homepage_path)
    end
end