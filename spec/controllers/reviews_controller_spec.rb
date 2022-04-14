require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
    before(:all) do
        puts "HI THIS IS RUNNING REVIEWS"
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
    
    describe "indexupper" do
        it "indexupper Rendering" do
            get :indexupper
            expect(response).to render_template "indexupper"
        end
    end
    
    describe "indexlower" do
        it "indexlower Rendering" do
            get :indexlower
            expect(response).to render_template "indexlower"
        end
    end
    
    
    describe "Update Review" do
        it "updating a valid review" do
            @review = Review.create({:workTime => 5, :studyTime => 6, :diffculty => 7, :timeWish => 8})
            @review.update({:workTime => 10})
            @review.update({:studyTime => 10})
            @review.update({:diffculty => 10})
            @review.update({:timeWish => 10})
            expect(@review.workTime).to eq(10)
            expect(@review.studyTime).to eq(10)
            expect(@review.diffculty).to eq(10) 
            expect(@review.timeWish).to eq(10)
        end
        
        it "updating another valid review" do
            @review = Review.create({:workTime => 5, :studyTime => 6, :diffculty => 7, :timeWish => 8})
            @review.update({:workTime => 14})
            @review.update({:studyTime => 11})
            @review.update({:diffculty => 6})
            @review.update({:timeWish => 7})
            expect(@review.workTime).to eq(14)
            expect(@review.studyTime).to eq(11)
            expect(@review.diffculty).to eq(6) 
            expect(@review.timeWish).to eq(7)
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
        
        
        it "returns another valid review" do
            @review = Review.create({:workTime => 38, :studyTime => 16, :diffculty => 1, :timeWish => 28})
            expect(@review.workTime).to eq(38)
            expect(@review.studyTime).to eq(16)
            expect(@review.diffculty).to eq(1) 
            expect(@review.timeWish).to eq(28)
        end
        
        # it "return an invalid review" do 
        #     @review1 = Review.create({:workTime => "abc", :studyTime => "-abc", :diffculty => "asf", :timeWish => "asf"})
        #     expect(@review1.workTime).to_not be_valid
        #     expect(@review1.studyTime).to_not be_valid
        #     expect(@review1.diffculty).to_not be_valid
        #     expect(@review1.timeWish).to_not be_valid
        # end
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
    
    
    describe "Destroying a review" do
        it "Destroy method works properly" do
            @review = controller.new()
            @review = @review.destroy()
            expect(@review.users_id).to eq(nil)
        end
        
        it 'Destroys a review that has non empty parameters' do 
            @review = Review.create({:workTime => 38, :studyTime => 16, :diffculty => 1, :timeWish => 28, :users_id => "dummyuser"})
            @review = @review.destroy()
            expect(@review.users_id).to eq("dummyuser")
        end
        
    end
    
    
    describe "Pin feature on a Review" do
        it "Pins a review" do
            @review = Review.create({:workTime => 38, :studyTime => 16, :diffculty => 1, :timeWish => 28, :pin => true})
            expect(@review.pin).to eq(true)
        end
        
        it "Pinning another review" do
            @review = Review.create({:workTime => 1, :studyTime => 2, :diffculty => 3, :timeWish => 4, :pin => true})
            expect(@review.pin).to eq(true)
        end
        
        it "Unpinning a review" do
            @review = Review.create({:workTime => 38, :studyTime => 16, :diffculty => 1, :timeWish => 28, :pin => true})
            @review.pin = false
            expect(@review.pin).to eq(false)
        end
        
        it "Unpinning another review" do
            @review = Review.create({:workTime => 6, :studyTime => 5, :diffculty => 4, :timeWish => 3, :pin => true})
            @review.pin = false
            expect(@review.pin).to eq(false)
        end
    end
    
    describe "Flag feature on a Review" do
        it "Flagging a review" do
            @review = Review.create({:workTime => 38, :studyTime => 16, :diffculty => 1, :timeWish => 28, :flag => false})
            @review.flag = true
            expect(@review.flag).to eq(true)
        end
        it "Flagging another review" do
            @review = Review.create({:workTime => 2, :studyTime => 3, :diffculty => 4, :timeWish => 5, :flag => false})
            @review.flag = true
            expect(@review.flag).to eq(true)
        end
        
        it "Unflagging a review" do
            @review = Review.create({:workTime => 38, :studyTime => 16, :diffculty => 1, :timeWish => 28, :flag => true})
            @review.flag = false
            expect(@review.flag).to eq(false)
        end
        
        it "Unflagging another review" do
            @review = Review.create({:workTime => 1, :studyTime => 1, :diffculty => 2, :timeWish => 2, :flag => true})
            @review.flag = false
            expect(@review.flag).to eq(false)
        end
    end
end