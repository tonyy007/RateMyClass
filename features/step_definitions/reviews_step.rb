require 'digest'

# Creates reviews for all of the seeded info
# Given /the following reviews exist/ do |reviews_table|
#   reviews_table.hashes.each do |review|
#     Review.create review
#   end
# end

# Then /^a review with "(.+)", "(.+)", "(.+)", "(.+)", "(.+)", "(.+)", "(.+)", "(.+)", "(.+)", "(.+)", "(.+)", "(.+)"  exists$/ do |review_course_title, review_course_code, review_professor_name, review_university_name, review_workTime, review_studyTime, review_diffculty, review_timeWish|
#   expect(Review.find_by(:review_professor_name => review_professor_name).review_course_title).to eq(review_course_title)
#   expect(Review.find_by(:review_professor_name => review_professor_name).review_course_code).to eq(review_course_code)
#   expect(Review.find_by(:review_professor_name => review_professor_name).review_professor_name).to eq(review_professor_name)
#   expect(Review.find_by(:review_professor_name => review_professor_name).review_university_name).to eq(review_university_name)
#   expect(Review.find_by(:review_professor_name => review_professor_name).review_workTime).to eq(review_workTime)
#   expect(Review.find_by(:review_professor_name => review_professor_name).review_studyTime).to eq(review_studyTime)
#   expect(Review.find_by(:review_professor_name => review_professor_name).review_workTime).to eq(review_workTime)
#   expect(Review.find_by(:review_professor_name => review_professor_name).review_diffculty).to eq(review_diffculty)
#   expect(Review.find_by(:review_professor_name => review_professor_name).review_timeWish).to eq(review_timeWish)

#   # expect(User.find_by(:username => username).username).to eq(username)
#   # expect(User.find_by(:username => username).password_hash).to eq(Digest::SHA256.hexdigest password)
#   # current_path.should == path_to('homepage')
# end
