require 'rails_helper'

RSpec.describe HomepageController, type: :controller do
  before(:all) do
    # if Movie.where(:director => "Jon Favreau").empty?
    #   Movie.create(:title => "Iron Man", :director => "Jon Favreau",
    #               :rating => "PG-13", :release_date => "2008-05-02")
    #   Movie.create(:title => "Spider-Man: Homecoming", :director => "Jon Favreau",
    #               :rating => "PG-13", :release_date => "2017-07-07")
    # end
    
    # if Movie.where(:title => "Big Hero 6").empty?
    #   Movie.create(:title => "Big Hero 6", 
    #               :rating => "PG", :release_date => "2014-11-07")
    end
    
# describe "when trying to find movies by the same director" do
#     it "returns a valid collection when a valid director is present" do
#       get :show_by_director, params:{:id => Movie.find_by_title("Iron Man")}
#       expect(assigns(:movies)).to eq([Movie.find_by_title("Spider-Man: Homecoming")])
#       expect(response).to render_template "show_by_director"
#     end
    
#     end
    
    
  end