require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    before(:all) do
        #User.create({:username => 'testuser1', :password_hash => 'passwordpasswordpasswordpasswordpasswordpassword', :type_of_user => 'student'}) 
    end
    
    describe "when trying to create a user" do
        it "returns a valid user" do
            @user = User.create({:username => 'testuser2', :password_hash => 'passwordpasswordpasswordpasswordpasswordpassword', :type_of_user => 'student'})
            #@user = controller.create({:username => 'testuser3', :password_hash => 'passwordpasswordpasswordpasswordpasswordpassword', :type_of_user => 'student'})
            expect(@user.username).to eq('testuser2')
            expect(@user.password_hash).to eq('passwordpasswordpasswordpasswordpasswordpassword')
            expect(@user.type_of_user).to eq('student') 
        end
    end
    
    describe "when trying to show all users" do
        it "returns all valid users" do
            @users = controller.index()
            expect(@users.all.length()).to eq 0
        end
    end
    
    describe "when trying to make a blank new user" do
        it "returns a valid user" do
            @user = controller.new()
            expect(@user.username).to eq(nil)
            expect(@user.password_hash).to eq(nil)
            expect(@user.type_of_user).to eq(nil) 
        end
    end
end