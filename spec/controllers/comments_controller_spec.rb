require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
    puts "HI THIS IS RUNNING COMMENTS"
    before(:all) do
        Comment.create({:review_id => 1, :body => "I HATE THIS", :users_id => "account1536"})
    end
    
    describe "Comment Edit" do
        it "Edit Rendering" do
            @comment = Comment.create({:review_id => 2, :body => "I LIKE THIS", :users_id => "account1779"})
            @comment.update({:body => "THIS IS GREAT"})
            expect(@comment.body).to eq("THIS IS GREAT")
        end
    end
end