require 'digest' # for hashing protected user data
require 'open-uri'

# homepage controller, processes sign up and log in credentials; extends application controller
class HomepageController < ApplicationController
    
    # will render the homepage as a get request rather than post
    def homepage_s
        
    end
    
    # will render the pre-homepage admin sign up page to confirm that a user registering as an admin is authorized to do so
    def homepage_a
        @username = $username
        @password = $password
    end
    
    # will render the homepage and check the log in or sign up credentials
    def homepage
        if Rails.application.routes.recognize_path(request.referrer)[:action] == "homepage_a" # if coming from the pre-homepage admin registering page, process sign up here
            @adminpasshash = "63631272c04c2b743df1af3464d4eb4486fce360c0a881657bed14a32e5b2928" # hash of the admin password to authorize creating admin accounts
            if @adminpasshash == (Digest::SHA256.hexdigest params[:adminpass].to_s) # check is both admin passwords are equal
                @new_user = User.create!({:username => params[:username], :password_hash => params[:password], :type_of_user => "admin"}) # create user
                # set session username and type in cookies
                session[:current_username] = params[:username] 
                session[:type] = @new_user.type_of_user
                redirect_to({ :action=>'homepage_s', :controller=>'homepage' }) # redirect to get homepage
            else # if admin password is incorrect, redirect to sign up page
                flash[:notice] = "Incorrect Admin Code"
                redirect_to({ :action=>'signup', :controller=>'signup' }, :alert => "Incorrect Admin Code")
            end
        elsif Rails.application.routes.recognize_path(request.referrer)[:action] == "login" # if coming from the login page
            if params[:user] == nil
                return
            end
            params[:user].each do |value|
                @username = value[1] # set the username to what was entered by user
            end
            params[:pass].each do |value|
                @password = Digest::SHA256.hexdigest value[1] # set the password to the hash of what was entered by the user
            end
            @credentials = false # set credentials false by default
            @users = User.all # get users database
            @users.each do |user| # loop through all users
                if (user.username == @username) and (user.password_hash == @password) # if a username and password match are found
                    #continue to homepage
                    @credentials = true
                    # set session username and type in cookies
                    session[:current_username] = @username
                    session[:type] = user.type_of_user
                    break
                end
            end
            if @credentials == false # if no username-password match found, redirect to login page
                flash[:notice] = "Incorrect Username or Password"
                redirect_to({ :action=>'login', :controller=>'login' }, :alert => "Incorrect Username or Password")
            else # else continue to homepage
                redirect_to({ :action=>'homepage_s', :controller=>'homepage' })
            end
        elsif Rails.application.routes.recognize_path(request.referrer)[:action] == "signup" # if coming from the signup page
            @users = User.all # get users database
            @username_success = false # set false by default
            @password_success = false # set false by default
            @duplicate = false # set false by default
            if params[:user] == nil
                return
            end
            params[:user].each do |value|
                if value[1].empty? # catch if username field empty
                    @username_success = false
                elsif value[1].length < 8 # catch is username field is less than 8 characters
                    @username_success = false
                else
                    @users.each do |user| # loop through all users
                        if value[1] == user.username # catch if there is a duplicate username already in the database
                            @credentials = false
                            @duplicate = true
                        end
                    end
                    if @duplicate == false # if no duplicate, set username
                        @username_success = true
                        @username = value[1]
                    else
                        @username_success = false
                    end
                end
            end
            params[:pass].each do |value|
                if value[1].empty? # catch if password field empty
                    @password_success = false
                elsif value[1].length < 8 # catch is password field is less than 8 characters
                    @password_success = false
                else
                    @password_success = true
                    @password = Digest::SHA256.hexdigest value[1] # hash password and set
                end
            end
            if @username_success and @password_success # if both username and password are acceptable
                if params[:typeofuser] == "admin" # if user type is admin, redirect to the admin pre-homepage sign up
                    $username = @username
                    $password = @password
                    redirect_to({ :action=>'homepage_a', :controller=>'homepage' })
                else # else sign up as normal
                    @new_user = User.create!({:username => @username, :password_hash => @password, :type_of_user => params[:typeofuser]}) # create user
                    # set session username and type in cookies
                    session[:current_username] = @username
                    session[:type] = @new_user.type_of_user
                    redirect_to({ :action=>'homepage_s', :controller=>'homepage' }) # redirect to get homepage
                end
            elsif @duplicate == true # if a duplicate username, redirect to sign up page and notify user
                flash[:notice] = "Username already exists"
                redirect_to({ :action=>'signup', :controller=>'signup' }, :alert => "Username already exists")
            else # if an invalid username or password, redirect to sign up page and notify user
                flash[:notice] = "Invalid Username or Password (Both must be at least 8 characters long)"
                redirect_to({ :action=>'signup', :controller=>'signup' }, :alert => "Invalid Username or Password")
            end
        else
            # continue to homepage as normal
        end
    end 
end