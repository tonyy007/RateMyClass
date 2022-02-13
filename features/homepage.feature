Feature: Homepage of RateMyClass

As a Student
So that I have the ability to post/flag//comment etc. on RateMyClass
I want to reach the homepage of the RateMyClass website.

As a Professor
So that I have the ability to post/flag//comment etc. on RateMyClass
I want to reach the homepage of the RateMyClass website.

Scenario: At the homepage, I am able to go to the reviews database
  When I go to the login page
  And I fill in "user_field" with "account1"
  And I fill in "pass_field" with "account1"
  And I press "Log in"
  And I go to reviews page
  Then I should be on the reviews page


Scenario: At the homepage, I am able go to the new reviews page
  When I go to the login page
  And I fill in "user_field" with "account1"
  And I fill in "pass_field" with "account1"
  And I press "Log in"
  And I go to reviews page
  And I go to new reviews page
  Then I should be on the new reviews page
  
Scenario: At the homepage, I am able to make a new review
  When I go to the login page
  And I fill in "user_field" with "account1"
  And I fill in "pass_field" with "account1"
  And I press "Log in"
  And I go to reviews page
  And I go to new reviews page
  And I fill in "review_workTime" with "20"
  And I fill in "review_studyTime" with "10"
  And I check "review_diffculty_4"
  And I fill in "review_timeWish" with "10"
  And I press "Create Review"
