# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# User.create!({:username => 'cakedaddy69', :password_hash => 'painfullythicc456', :type_of_user => 'student'})
# User.create!({:username => 'defaultaccount1', :password_hash => 'defaultaccount1', :type_of_user => 'student'})
# User.create!({:username => 'dummyaccount', :password_hash => 'dummyaccount', :type_of_user => 'student'})
Review.create!(:course_title => "csce", :course_code =>  "121", :professor_name => "Robert Lightfoot", :university_name => "Texas A&M University", :workTime => "10", :studyTime => "10", :diffculty => "review_diffculty_4", :timeWish => "10")