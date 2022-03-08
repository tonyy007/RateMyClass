require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    # before(:all) do
        # User.create({:username => 'testuser1', :password_hash => 'passwordpasswordpasswordpasswordpasswordpassword', :type_of_user => 'student'}) 
    # end
    
    subject { 
         UsersController.new(username: "some_username",
                            password_hash: "some_password", 
                            type_of_user: "student"
         )  
      }
      
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
    
    
# describe "show" do
#     it "movie's show method" do 
#       get :show, params:{:user => {:username => "some_username2", :password_hash => "some_password2", :type_of_user => "student"}}
#       expect(response).to render_template "show"
#     end
#   end
    
    # describe "create" do
    #     it "create Rendering" do
    #         # @user = User.create({:username => 'testuser10', :password_hash => 'testuser10', :type_of_user => 'student'}) 
    #         get :create, params:{:user => {:username => "some_username2", :password_hash => "some_password2", :type_of_user => "student"}}
    #         # expect(response).to render_template "create"
    #         expect(response).to redirect_to user_url(@user)
    #     end
    # end
    
    # describe "update" do
    #     it "update Rendering" do
    #         get :update
    #         expect(response).to render_template "update"
    #     end
    # end
    
    describe "when trying to update a user" do
        it "updates a user's password" do
            @user = User.create({:username => 'testuser9', :password_hash => 'passwordpasswordpasswordpasswordpasswordpassword', :type_of_user => 'student'})
            @user.update({:password_hash => 'testuser9'})
            expect(@user.username).to eq('testuser9')
            expect(@user.password_hash).to eq('testuser9')
            expect(@user.type_of_user).to eq('student') 
        end
        
        it "updates a user's username" do
            @user = User.create({:username => 'testuser90', :password_hash => 'passwordpasswordpasswordpasswordpasswordpassword', :type_of_user => 'student'})
            @user.update({:username => 'testuser9'})
            expect(@user.username).to eq('testuser9')
            expect(@user.password_hash).to eq('passwordpasswordpasswordpasswordpasswordpassword')
            expect(@user.type_of_user).to eq('student') 
        end
        
        it "updates a user's type" do
            @user = User.create({:username => 'testuser0', :password_hash => 'passwordpasswordpasswordpasswordpasswordpassword', :type_of_user => 'student'})
            @user.update({:type_of_user => 'admin'})
            expect(@user.username).to eq('testuser0')
            expect(@user.password_hash).to eq('passwordpasswordpasswordpasswordpasswordpassword')
            expect(@user.type_of_user).to eq('admin') 
        end
    end
    
    # describe "when trying to destroy a user" do
    #     it "a user is destroyed" do
    #         @user = User.create({:username => 'testuser9', :password_hash => 'testuser9', :type_of_user => 'student'})
    #         @user.destroy()
    #         # expect(@user.username).to eq('testuser9')
    #         # expect(@user.password_hash).to eq('testuser9')
    #         # expect(@user.type_of_user).to eq('student') 
    #         # expect(response).to redirect_to users_url
    #         # expect(flash[:notice]).to match(/User was successfully destroyed./)
    #     end
    # end

    # describe "destroy" do
    #         it "returns a valid user" do
    #         @user = controller.new()
    #         get :destroy
    #         expect(response).to redirect_to users_url
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
        
        it "returns another valid user" do
            @user = User.create({:username => 'testuser30', :password_hash => 'testuser30', :type_of_user => 'student'})
            #@user = controller.create({:username => 'testuser3', :password_hash => 'passwordpasswordpasswordpasswordpasswordpassword', :type_of_user => 'student'})
            expect(@user.username).to eq('testuser30')
            expect(@user.password_hash).to eq('testuser30')
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