class Signup
    def initialize(user, pass)
        @user = User.new(user, pass) #create an instance of the user class with user and pass
        
        #***TODO: ADD @user TO DATABASE***
    end
end