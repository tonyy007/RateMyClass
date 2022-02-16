# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!({:username => 'cakedaddy69', :password_hash => 'painfullythicc456', :type_of_user => 'student'})
User.create!({:username => 'defaultaccount1', :password_hash => 'defaultaccount1', :type_of_user => 'student'})
User.create!({:username => 'dummyaccount', :password_hash => 'dummyaccount', :type_of_user => 'student'})
Review.create!(:review_course_title => "csce", :review_course_code =>  "121", :review_professor_name => "Robert Lightfoot", :review_university_name => "Texas A&M University", :review_workTime => "10", :review_studyTime => "10", :review_diffculty => "review_diffculty_4", :review_timeWish => "10")