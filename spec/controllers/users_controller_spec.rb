require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    # before(:all) do
        # User.create({:username => 'testuser1', :password_hash => 'passwordpasswordpasswordpasswordpasswordpassword', :type_of_user => 'student'}) 
    # end
    
    # subject { 
    #      described_class.new(username: "some_username",
    #                         password_hash: "some_password", 
    #                         type_of_user: "student"
    #      )  
    #   }
      
    # describe "Addional User Validations" do
    #     it "valid attributes met" do
    #         expect(subject).to be_valid
    #     end
    # end
    
    
    describe "Index" do
        it "Index Rendering" do
            get :index
            expect(response).to render_template "index"
        end
    end
    
    
    describe "new" do
        it "new Rendering" do
            get :new
            expect(response).to render_template "new"
        end
    end
    
    
    
    # describe "create" do
    #     it "create Rendering" do
    #         get :create, params:{:username => "testuser1", :password_hash => "testuser1", :type_of_user => "student"}
    #         expect(response).to render_template "create"
    #     end
    # end
    
    # describe "update" do
    #     it "update Rendering" do
    #         get :update
    #         expect(response).to render_template "update"
    #     end
    # end
    
    describe "when trying to create a user" do
        it "returns a valid user" do
            @user = User.create({:username => 'testuser2', :password_hash => 'passwordpasswordpasswordpasswordpasswordpassword', :type_of_user => 'student'})
            #@user = controller.create({:username => 'testuser3', :password_hash => 'passwordpasswordpasswordpasswordpasswordpassword', :type_of_user => 'student'})
            expect(@user.username).to eq('testuser2')
            expect(@user.password_hash).to eq('passwordpasswordpasswordpasswordpasswordpassword')
            expect(@user.type_of_user).to eq('student') 
        end
        
        # it "invalid input, user is not created" do
        #     @user = User.create({:username => 'abc', :password_hash => 'abc', :type_of_user => 'abc'})
        #     expect(@user.username).to_not be_valid
        #     expect(@user.password_hash).to_not be_valid
        #     expect(@user.type_of_user).to_not be_valid
        # end
    end
    
    describe "when trying to show all users" do
        it "returns all valid users" do
            @users = controller.index()
            expect(@users.all.length()).to eq 2
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