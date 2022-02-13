Feature: To be able to create, edit, delete review
  
As a student  
Create, edit, delete a review

As a professor
Look at reviews


Scenario: Creating a new review
  When I go to new reviews page
  And I fill in "review_workTime" with "30"
  And I fill in "review_studyTime" with "12"
  And I check "review_diffculty_4"
  And I fill in "review_timeWish" with "7"