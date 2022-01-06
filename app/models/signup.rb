class Signup
    attr_accessor :username
    def initialize(user, pass)
        @username = user
        @user = User.new(user, pass) #create an instance of the user class with user and pass
        
        #***TODO: ADD @user TO DATABASE***
    end
end