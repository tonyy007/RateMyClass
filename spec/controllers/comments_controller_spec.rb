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
        
        it "Another Edit Rendering" do
            @comment = Comment.create({:review_id => 2, :body => "I DO NOT LIKE THIS", :users_id => "account1779"})
            @comment.update({:body => "THIS IS NOT THAT BAD"})
            expect(@comment.body).to eq("THIS IS NOT THAT BAD")
        end
    end
    
    describe "Comment Flag" do
        it "Comment being flagged" do
            @comment = Comment.create({:review_id => 2, :body => "I LIKE THIS", :users_id => "account1779", :flag => false})
            @comment.update({:flag => true})
            expect(@comment.flag).to eq(true)
        end
        
        it "Another Comment being flagged" do
            @comment = Comment.create({:review_id => 10, :body => "The class was cool", :users_id => "account123", :flag => false})
            @comment.update({:flag => true})
            expect(@comment.flag).to eq(true)
        end
        
        it "Comment being unflagged" do
            @comment = Comment.create({:review_id => 50, :body => "The class was really really uncool", :users_id => "account321", :flag => false})
            @comment.update({:flag => true})
            @comment.update({:flag => false})
            expect(@comment.flag).to eq(false)
        end
        
        it "Comment being unflagged" do
            @comment = Comment.create({:review_id => 23, :body => "The class was really awesome", :users_id => "account9", :flag => false})
            @comment.update({:flag => true})
            @comment.update({:flag => false})
            expect(@comment.flag).to eq(false)
        end
    end
end