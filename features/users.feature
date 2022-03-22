Feature: Users Database of RateMyClass

As an Admin
So that I have the ability to remove/see users
I want to reach the users database

Background:
  Given I am logged in as an admin "defaultadmin1" with password "defaultadmin1"
  And I go to homepage

Scenario: I am able to go to the Users Database
  When I go to users database page
  Then I should be on the users database page

Scenario: I am able to create a new User to the Database
  When I go to users database page
  Then I should be on the users database page
  Then I should see "New User"
  And I follow the first link "New User"
  And I fill in "user_username" with "Account100"
  And I fill in "user_password_hash" with "Account100"
  And I fill in "user_type_of_user" with "admin"
  And I press "Create User"
  Then I should be on the users database page
  
Scenario: I do not meet the criteria to create a user
  When I go to users database page
  And I follow the first link "New User"
  And I create an invalid user

Scenario: I am able to edit a newly created User to the Database
  When I go to users database page
  Then I should be on the users database page
  And I follow the first link "New User"
  And I fill in "user_username" with "Account100"
  And I fill in "user_password_hash" with "Account100"
  And I fill in "user_type_of_user" with "admin"
  And I press "Create User"
  And I follow "Edit"
  And I fill in "user_username" with "Account200"
  And I fill in "user_password_hash" with "Account200"
  And I press "Update User"
  
Scenario: I am able to go back to the Users database after creating a user
  When I go to users database page
  Then I should be on the users database page
  And I follow the first link "New User"
  And I fill in "user_username" with "Account100"
  And I fill in "user_password_hash" with "Account100"
  And I fill in "user_type_of_user" with "admin"
  And I press "Create User"
  And I follow "Back"
  Then I should be on the users database page
  
Scenario: I am able to edit the first user and return back to the database
  When I go to users database page
  And I follow the first link "Edit"
  And I fill in "user_username" with "abcabcabc"
  And I fill in "user_password_hash" with "abcabcabc"
  And I press "Update User"
  Then I should see "User was successfully updated."
  Then I should be on the users database page

Scenario: I am able to destory the first user
  When I go to users database page
  Then I should be on the users database page
  Then I should see "New User"
  And I follow the first link "New User"
  And I fill in "user_username" with "student100"
  And I fill in "user_password_hash" with "student100"
  And I fill in "user_type_of_user" with "student"
  And I press "Create User"
  When I go to users database page
  Then I press "destory_student100"