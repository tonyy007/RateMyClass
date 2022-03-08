require 'rails_helper'

# Source: https://semaphoreci.com/community/tutorials/how-to-test-rails-models-with-rspec

RSpec.describe Comment, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
    # before(:all) do
        #User.create({:username => 'testuser1', :password_hash => 'passwordpasswordpasswordpasswordpasswordpassword', :type_of_user => 'student'}) 
        # if Comment.where(:comments => "Base test Comment").empty?
        #     Comment.create(:comments => "Base test Comment")
        # end
    # end
    
    # describe "Creating a comment" do
    #     it "creates a new comment in the database" do
    #         comment = Comment.create(:comments => "New Test Comment")
    #         # expect(comment).to eq("New Test Comment")
    #     end
    # end
    subject {
    Comment.new(body: "Lorem ipsum",
                        review_id: 0,
                        created_at: DateTime.now,
                        updated_at: DateTime.now + 1.week)
    }
    
    describe "validation of comments" do 
        # it "is valid with valid attributes" do  # FixME
        #     expect(invalid_comment).to be_valid
        # end
        
      
        it "A comment is not valid without a body" do
            subject.body = nil
            expect(subject).to_not be_valid
        end
        
        it "A comment cannot exist without being tied to a review" do
            subject.review_id = nil
            expect(subject).to_not be_valid
        end
        
        
        it "A comment must exist with a valid review id" do
            subject.review_id = -1
            expect(subject).to_not be_valid
        end
        
        it "A comment cannot be too long" do
            subject.body = 'c' * 1000000
            expect(subject).to_not be_valid
        end
        
        it "A comment cannot be too short" do
            subject.body = 'b'
            expect(subject).to_not be_valid
        end
        
        # it "A comment exists being tied to a review" do
            # valid_comment = Comment.new(Comment_id: 0, body: "Howdy", review_id: 0, created_at: DateTime.now, updated_at: DateTime.now + 1.week)
            # expect(valid_comment).to be_valid
        # end
        
        it "A comment must have a timestamp of it being updated" do
            subject.updated_at = nil
            expect(subject).to_not be_valid
        end
        
        it "A comment must have a timestamp of its creation" do
            subject.created_at = nil
            expect(subject).to_not be_valid
        end
        
        it "Creating a valid comment" do
            @comment = Comment.new(:body => "Great Professor!")
        end
    end
    
    describe "Flagging feature for comments" do
        it "Flagging a comment correctly" do
            @comment = Comment.new(:body => "Great Professor!", :flag => false)
            @comment.flag = true
            expect(@comment.flag).to eq(true)
        end
        it "Unflagging a comment" do
            @comment = Comment.new(:body => "Great Professor!", :flag => true)
            @comment.flag = false
            expect(@comment.flag).to eq(false)
        end
    end
    
    
    describe "Updating feature for comments" do
        it "Updating a comment correctly" do
            @comment = Comment.new(:body => "Great Professor!")
            @comment.update({:body => "Nevermind, he wasn't half bad."})
            expect(@comment.body).to eq("Nevermind, he wasn't half bad.")
        end
        it "Updating another comment correctly" do
            @comment = Comment.new(:body => "Great Professor!")
            @comment.update({:body => "Wonderful Professor!"})
            expect(@comment.body).to eq("Wonderful Professor!")
        end
        
        it "Blank comment update" do
            @comment = Comment.new(:body => "Great Professor!")
            @comment.update({:body => ""})
            expect(@comment.body).to eq("")
        end
    end
    
end
