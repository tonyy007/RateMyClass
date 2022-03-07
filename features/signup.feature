Feature: Signup Account Creation

As a student
So that I have the ability to post/flag/etc. on RateMyClass
I want to add a student to the RateMyClass database

Scenario: Signup Successful, meeting all required criteria
  When I go to the signup page
  And I fill in "user_field" with "account1"
  And I fill in "pass_field" with "account1"  
  And I select "student" from "typeofuser"
  And I press "Sign up"
  Then a user with the name "account1" with a password "account1" exists  
  
Scenario: Another Signup Successful, meeting all required criteria
  When I go to the signup page
  And I fill in "user_field" with "account2"
  And I fill in "pass_field" with "account2"
  And I select "student" from "typeofuser"
  And I press "Sign up"
  Then a user with the name "account2" with a password "account2" exists

Scenario: Signup Failed, password did not meet all required criteria
  When I go to the signup page
  And I fill in "user_field" with "account1"
  And I fill in "pass_field" with "abc"
  And I press "Sign up"
  Then a user with the name "account1" with a password "abc" should not exist
  
Scenario: Signup Failed, username did not meet all required criteria
  When I go to the signup page
  And I fill in "user_field" with "acc"
  And I fill in "pass_field" with "abcachwri"
  And I press "Sign up"
  Then a user with the name "acc" with a password "abcachwri" should not exist
  
Scenario: Signup Failed, username empty
  When I go to the signup page
  And I fill in "user_field" with ""
  And I fill in "pass_field" with "abcachwri"
  And I press "Sign up"
  Then a user with the name "" with a password "abcachwri" should not exist
  
Scenario: Signup Failed, password empty
  When I go to the signup page
  And I fill in "user_field" with "policedepartment"
  And I fill in "pass_field" with ""
  And I press "Sign up"
  Then a user with the name "policedepartment" with a password "" should not exist
  
Scenario: Login Failed, user does not exist
  When I go to the login page
  And I fill in "user_field" with "policedepartment"
  And I fill in "pass_field" with "reugierohgiw"
  And I press "Log in"
  Then I should not be logged in
  
Scenario: Login Failed, password is wrong
  When I go to the login page
  And I fill in "user_field" with "account1"
  And I fill in "pass_field" with "reugierohgiw"
  And I press "Log in"
  Then I should not be logged in
  
  
Scenario: User click Login but then clicks sign up
  When I go to the login page
  And I fill in "user_field" with "account1"
  And I fill in "pass_field" with "account1"
  And I follow "Don't Have An Account? Sign Up Here"
  Then I should be on the homepage

Scenario: Login Successful, username and password correct
  When I go to the signup page
  And I fill in "user_field" with "account1"
  And I fill in "pass_field" with "account1"  
  And I press "Sign up"
  Then a user with the name "account1" with a password "account1" exists 
  When I go to the login page
  And I fill in "user_field" with "account1"
  And I fill in "pass_field" with "account1"
  And I press "Log in"
  Then I should be on the homepage