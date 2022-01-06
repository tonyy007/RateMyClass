class RatemyclassController < ApplicationController
    def signup
        
    end
    
    def login

    end
    
    def homepage
        if Rails.application.routes.recognize_path(request.referrer)[:action] == "login" #coming from the login page
            params[:user].each do |value|
                if value[1].empty?
                    flash[:notice] = "Incorrect Username or Password"
                    redirect_to({ :action=>'login' }, :alert => "Incorrect Username")
                else
                    @username = value[1]
                end
            end
            params[:pass].each do |value|
                if value[1].empty?
                    flash[:notice] = "Incorrect Username or Password"
                    redirect_to({ :action=>'login' }, :alert => "Incorrect Password")
                else
                    @password = value[1]
                end
            end 
        elsif Rails.application.routes.recognize_path(request.referrer)[:action] == "signup" #coming from the signup page
            params[:user].each do |value|
                if value[1].empty?
                    flash[:notice] = "Invalid Username or Password"
                    redirect_to({ :action=>'signup' }, :alert => "Invalid Username")
                else
                    @username = value[1]
                end
            end
            params[:pass].each do |value|
                if value[1].empty?
                    flash[:notice] = "Invalid Username or Password"
                    redirect_to({ :action=>'signup' }, :alert => "Invalid Password")
                else
                    @password = value[1]
                end
            end
        end
            
    end
end

#Test rendering for verification
#render :html => @username + @password.html_safe