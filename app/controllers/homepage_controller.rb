require 'digest'
require 'open-uri'
class HomepageController < ApplicationController
    def homepage_s
        
    end
    
    def homepage_a
        @username = $username
        @password = $password
    end
    
    def homepage
        if Rails.application.routes.recognize_path(request.referrer)[:action] == "homepage_a"
            @adminpasshash = "63631272c04c2b743df1af3464d4eb4486fce360c0a881657bed14a32e5b2928"
            if @adminpasshash == (Digest::SHA256.hexdigest params[:adminpass].to_s)
                @new_user = User.create!({:username => params[:username], :password_hash => params[:password], :type_of_user => "admin"})
                session[:current_username] = params[:username]
                session[:type] = @new_user.type_of_user
                redirect_to({ :action=>'homepage_s', :controller=>'homepage' })
            else
                flash[:notice] = "Incorrect Admin Code"
                redirect_to({ :action=>'signup', :controller=>'signup' }, :alert => "Incorrect Admin Code")
            end
        elsif Rails.application.routes.recognize_path(request.referrer)[:action] == "login" #coming from the login page
            if params[:user] == nil
                return
            end
            params[:user].each do |value|
                @username = value[1]
            end
            params[:pass].each do |value|
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
                # else
                #     @credentials = false
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
            if params[:user] == nil
                return
            end
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
                    @password_success = false
                elsif value[1].length < 8
                    @password_success = false
                else
                    @password_success = true
                    @password = Digest::SHA256.hexdigest value[1]
                end
            end
            if @username_success and @password_success
                if params[:typeofuser] == "admin"
                    $username = @username
                    $password = @password
                    redirect_to({ :action=>'homepage_a', :controller=>'homepage' })
                else
                    @new_user = User.create!({:username => @username, :password_hash => @password, :type_of_user => params[:typeofuser]})
                    session[:current_username] = @username
                    session[:type] = @new_user.type_of_user
                    redirect_to({ :action=>'homepage_s', :controller=>'homepage' })
                end
            elsif @duplicate == true
                flash[:notice] = "Username already exists"
                redirect_to({ :action=>'signup', :controller=>'signup' }, :alert => "Username already exists")
            else
                flash[:notice] = "Invalid Username or Password (Both must be at least 8 characters long)"
                redirect_to({ :action=>'signup', :controller=>'signup' }, :alert => "Invalid Username or Password")
            end
        else
            #WILL PRINT OUT A LOT, UNCOMMENT AT YOUR OWN PERIL
            # URI.open("https://web-as.tamu.edu/GradeReports/PDFReports/20213/grd20213EN.pdf") {|f|
            #     f.each_line {|line| p line}
            # }
        end
    end 
end