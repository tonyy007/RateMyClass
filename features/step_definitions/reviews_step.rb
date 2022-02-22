require 'digest'

# Creates reviews for all of the seeded info
Given /the following reviews exist/ do |reviews_table|
  reviews_table.hashes.each do |review|
    Review.create review
  end
end

Then /^a review with "(.+)", "(.+)", "(.+)", "(.+)", (.+), (.+), "(.+)", (.+) exists$/ do |course_title, course_code, professor_name, university_name, workTime, studyTime, diffculty, timeWish|
  expect(Review.find_by(:course_title => course_title).course_title).to eq(course_title)
  expect(Review.find_by(:course_code => course_code).course_code).to eq(course_code)
  expect(Review.find_by(:professor_name => professor_name).professor_name).to eq(professor_name)
  expect(Review.find_by(:university_name => university_name).university_name).to eq(university_name)
end

Then /^a review with "(.+)", "(.+)", "(.+)", "(.+)", (.+), (.+), "(.+)", (.+) should not exist$/ do |course_title, course_code, professor_name, university_name, workTime, studyTime, diffculty, timeWish|
  begin
    Review.find_by(:course_title => course_title).course_title
    rescue NoMethodError
    Review.find_by(:course_code => course_code).course_code
    rescue NoMethodError
    Review.find_by(:professor_name => professor_name).professor_name
    rescue NoMethodError
    Review.find_by(:university_name => university_name).university_name
    rescue NoMethodError
  end
end

Then /^(?:|I )create a comment with "(.+)"$/ do |comment|
  # data: { disable_with: false }
  # find('comment[body]')
  # fill_in 'comment[index]', :with => comment
end