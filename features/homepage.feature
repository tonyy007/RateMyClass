Feature: Homepage of RateMyClass

As a Student
So that I have the ability to post/flag//comment etc. on RateMyClass
I want to reach the homepage of the RateMyClass website.

As a Professor
So that I have the ability to post/flag//comment etc. on RateMyClass
I want to reach the homepage of the RateMyClass website.

Background:
  Given I am logged in as "defaultaccount1" with password "defaultaccount1"
  And I go to homepage

Scenario: At the homepage, I am able to go to the reviews database
  When I go to reviews page
  Then I should be on the reviews page


Scenario: At the homepage, I am able go to the new reviews page
  When I go to reviews page
  And I go to new reviews page
  Then I should be on the new reviews page
  
  
# Rewrite this
Scenario: At the homepage, I am able to make a new review
  When I go to reviews page
  And I go to new reviews page
  And I fill in "review_workTime" with "20"
  And I fill in "review_studyTime" with "10"
  And I check "review_diffculty_4"
  And I fill in "review_timeWish" with "10"
  And I press "Create Review"
  Then I should be on the reviews page
  
Scenario: At the homepage, I am able to go to the Users Database
  When I go to users database page
  Then I should be on the users database page
  
Scenario: At the homepage, The course look up works on an existing class
  When I fill in "search_field" with "CSCE 121"
  And I press "Search"
  Then I should be on the reviews page

Scenario: At the homepage, The course look up should not work on a class that does not exist
  When I fill in "search_field" with "Random 152324324"
  And I press "Search"
  Then I should not be on the reviews page