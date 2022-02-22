require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
    before(:all) do
        Review.create({:workTime => 5, :studyTime => 6, :diffculty => 7, :timeWish => 8}) 
    end
    
    describe "Index" do
        it "Index Rendering" do
            get :index
            expect(response).to render_template "index"
        end
    end
    
    
    describe "New" do
        it "New Rendering" do
            get :new
            expect(response).to render_template "new"
        end
    end
    
    
    describe "when trying to create a review" do
        it "returns a valid review" do
            @review = Review.create({:workTime => 5, :studyTime => 6, :diffculty => 7, :timeWish => 8})
            expect(@review.workTime).to eq(5)
            expect(@review.studyTime).to eq(6)
            expect(@review.diffculty).to eq(7) 
            expect(@review.timeWish).to eq(8)
        end
    end
    
    describe "when trying to show all reviews" do
        it "returns all valid reviews" do
            @reviews = controller.index()
            expect(@reviews[0].workTime).to eq(5)
            expect(@reviews[0].studyTime).to eq(6)
            expect(@reviews[0].diffculty).to eq(7) 
            expect(@reviews[0].timeWish).to eq(8)
        end
    end
    
    describe "when trying to make a blank new review" do
        it "returns a valid review" do
            @review = controller.new()
            expect(@review.workTime).to eq(nil)
            expect(@review.studyTime).to eq(nil)
            expect(@review.diffculty).to eq(nil) 
            expect(@review.timeWish).to eq(nil) 
        end
    end
end