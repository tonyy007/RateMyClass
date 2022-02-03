require 'rails_helper'

RSpec.describe HomepageController, type: :controller do
    before(:all) do
        #User.create({:username => 'testuser1', :password_hash => 'passwordpasswordpasswordpasswordpasswordpassword', :type_of_user => 'student'}) 
    end
    
    describe "when trying to create a user" do
        it "returns a valid user" do
            @user = User.create({:username => 'testuser2', :password_hash => 'passwordpasswordpasswordpasswordpasswordpassword', :type_of_user => 'student'})
            expect(@user.username).to eq('testuser2')
            expect(@user.password_hash).to eq('passwordpasswordpasswordpasswordpasswordpassword')
            expect(@user.type_of_user).to eq('student') 
        end
    end
    
    # describe "when trying to destroy a user" do
    #     it "destroys a valid user" do
    #       @user = User.create({:username => 'testuser2', :password_hash => 'passwordpasswordpasswordpasswordpasswordpassword', :type_of_user => 'student'})
    #       expect(@user.username).to eq('testuser2')
    #       expect(@user.password_hash).to eq('passwordpasswordpasswordpasswordpasswordpassword')
    #       expect(@user.type_of_user).to eq('student')
    #       User.destroy({:username => 'testuser2', :password_hash => 'passwordpasswordpasswordpasswordpasswordpassword', :type_of_user => 'student'})
    #       expect(@user.username).not_to eq('testuser2')
    #     end
    # end
end