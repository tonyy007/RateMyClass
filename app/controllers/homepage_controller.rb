require 'digest'
class HomepageController < ApplicationController
    def homepage_s
        
    end
    def homepage
        if Rails.application.routes.recognize_path(request.referrer)[:action] == "login" #coming from the login page
            params[:user].each do |value|
                # if value[1].empty?
                #     #flash[:notice] = "Incorrect Username or Password"
                #     #redirect_to({ :action=>'login', :controller=>'login' }, :alert => "Incorrect Username")
                # else
                #     @username = value[1]
                # end
                @username = value[1]
            end
            params[:pass].each do |value|
                # if value[1].empty?
                #     #flash[:notice] = "Incorrect Username or Password"
                #     #redirect_to({ :action=>'login', :controller=>'login' }, :alert => "Incorrect Password")
                # else
                #     @password = value[1]
                # end
                @password = Digest::SHA256.hexdigest value[1]
            end
            @credentials = false
            @users = User.all
            @users.each do |user|
                if (user.username == @username) and (user.password_hash == @password)
                    #continue to homepage
                    @credentials = true
                    session[:current_username] = @username
                    session[:type] = user.type_of_user
                    break
                else
                    @credentials = false
                end
            end
            if @credentials == false
                flash[:notice] = "Incorrect Username or Password"
                redirect_to({ :action=>'login', :controller=>'login' }, :alert => "Incorrect Username or Password")
            else
                redirect_to({ :action=>'homepage_s', :controller=>'homepage' })
            end
            #redirect_to(homepage_path)
        elsif Rails.application.routes.recognize_path(request.referrer)[:action] == "signup" #coming from the signup page
            @users = User.all
            @username_success = false
            @password_success = false
            @duplicate = false
            params[:user].each do |value|
                if value[1].empty?
                    # flash[:notice] = "Invalid Username or Password"
                    # redirect_to({ :action=>'signup', :controller=>'signup' }, :alert => "Invalid Username")
                    @username_success = false
                elsif value[1].length < 8
                    @username_success = false
                else
                    @users.each do |user|
                        if value[1] == user.username
                            @credentials = false
                            @duplicate = true
                        end
                    end
                    if @duplicate == false
                        @username_success = true
                        @username = value[1]
                    else
                        @username_success = false
                    end
                end
            end
            params[:pass].each do |value|
                if value[1].empty?
                    # flash[:notice] = "Invalid Username or Password"
                    # redirect_to({ :action=>'signup', :controller=>'signup' }, :alert => "Invalid Password")
                    @password_success = false
                elsif value[1].length < 8
                    @password_success = false
                else
                    @password_success = true
                    @password = Digest::SHA256.hexdigest value[1]
                end
            end
            if @username_success and @password_success
                @new_user = User.create!({:username => @username, :password_hash => @password, :type_of_user => 'student'})
                session[:current_username] = @username
                session[:type] = @new_user.type_of_user
                redirect_to({ :action=>'homepage_s', :controller=>'homepage' })
            elsif @duplicate == true
                flash[:notice] = "Username already exists"
                redirect_to({ :action=>'signup', :controller=>'signup' }, :alert => "Username already exists")
            else
                flash[:notice] = "Invalid Username or Password (Both must be at least 8 characters long)"
                redirect_to({ :action=>'signup', :controller=>'signup' }, :alert => "Invalid Username or Password")
            end
        elsif Rails.application.routes.recognize_path(request.referrer)[:action] == "logout"
            session[:type] = nil
            session[:current_username] = nil
            #redirect_to(homepage_path)
        end
    end 
end