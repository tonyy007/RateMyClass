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
        
    end
end
