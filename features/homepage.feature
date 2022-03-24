Feature: Homepage of RateMyClass

As a Student
So that I have the ability to post/flag//comment etc. on RateMyClass
I want to reach the homepage of the RateMyClass website.

As a Professor
So that I have the ability to post/flag//comment etc. on RateMyClass
I want to reach the homepage of the RateMyClass website.

Background:
  Given I am logged in as an admin "defaultadmin1" with password "defaultadmin1"
  And I go to homepage
  
  Given the following reviews exist:
  | course_title | course_code | professor_name   | university_name        | workTime | studyTime | diffculty          | timeWish        | thought        | users_id      |
  | csce         | 121         | Robert Lightfoot | Texas A&M University   | 10       | 5         | review_diffculty_4 | 10              | Easy Class     | dummystudent1 |
  
Scenario: At the homepage, I am able to logout
  When I follow "Log out"
  Then I should see "You are now logged out!"
  And I press the button "Click here to be redirected to homepage"
  Then I should be on the homepage

Scenario: At the homepage, as an admin, I am able to go to the reviews database
  When I go to reviews page
  Then I should be on the reviews page
  
Scenario: At the homepage, as an admin, I am able to go to the Users Database
  When I go to users database page
  Then I should be on the users database page
  
Scenario: At the homepage, as an admin, I am able go to the new reviews page and see message
  When I go to reviews page
  And I go to new reviews page
  Then I should see "You are not signed in as a student!"

Scenario: At the homepage, as an admin, I am unable to update reviews in the reviews database
  When I go to reviews page

  And I follow the first link "Show"
  Then I should see "Back"
  And I follow "Back"
  
Scenario: At the homepage, as an admin, I should not be able to make a new review
  When I go to reviews page
  And I go to new reviews page
  Then I should be on the reviews page
  
Scenario: At the homepage, as an admin, The course look up works on an existing class
  When I fill in "search_field" with "CSCE 121"
  And I press "Search"
  Then I should be on the indexupper page

Scenario: At the homepage, as an admin, The course look up should not work on a class that does not exist
  When I fill in "search_field" with "abc"
  And I press "Search"
  Then I should be on the no reviews page

Scenario: As any user, when I go to an unamed page, it should reroute to homepage
  When I go to random page
  Then I should be on the homepage

Scenario: As any user, when I go to an unamed page, it should reroute to homepage and should see invalid path
  When I go to random page
  Then I should be on the homepage

Scenario: Cancel login
  When I go to the login page
  And I follow "logo"
  Then I should be on the homepage

Scenario: Cancel Signup
  When I go to the signup page
  And I follow "logo"
  Then I should be on the homepage