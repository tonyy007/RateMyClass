$LOAD_PATH << File.dirname("~/RateMyClass/app/models/login.rb")
$LOAD_PATH << File.dirname("~/RateMyClass/app/models/user.rb")
$LOAD_PATH << File.dirname("~/RateMyClass/app/models/signup.rb")
require 'login'
require 'user'
require 'signup'

RSpec.describe Login do
    context 'correctly' do
        before :each do
            @user_login = Login.new('Tim', 'password123')
            @user = User.new('Tim', 'password123')
        end
        it "should accept a valid username when input" do      
          expect(@user_login).to be_an_instance_of(Login)
          expect(@user_login.username).not_to be_empty
        end
        it "should match the username of the user" do
            expect(@user_login.username).to eq(@user.username)
        end
        it "should match the password_hash of the user" do
            expect(@user_login.password_hash_login).to eq(@user_login.password_hash_user)
        end
    end
end

RSpec.describe Signup do
    context 'correctly' do
        before :each do
            @user_signup = Signup.new('Tim', 'password123')
        end
        it "should accept a valid username when input" do      
          expect(@user_signup).to be_an_instance_of(Signup)
          expect(@user_signup.username).not_to be_empty
        end
    end
end