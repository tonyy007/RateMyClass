Feature: Signup Account Creation

As a student
So that I have the ability to post/flag/etc. on RateMyClass
I want to add a student to the RateMyClass database

# Background: users in database
  # Taken from seed data:
    # Given the following users exist:
    # | username    | password_hash     | type_of_user |


Scenario: Signup Successful, meeting all required criteria
  When I go to the signup page
  And I fill in "user_field" with "account1"
  And I fill in "pass_field" with "account1"  
  And I press "Sign up"
  Then a user with the name "account1" with a password "account1" exists  
  
Scenario: Signup Successful, meeting all required criteria
  When I go to the signup page
  And I fill in "user_field" with "account2"
  And I fill in "pass_field" with "account2"
  And I press "Sign up"
  Then a user with the name "account2" with a password "account2" exists
  

Scenario: Signup Failed, did not meet all required criteria
  When I go to the signup page
  And I fill in "user_field" with "account1"
  And I fill in "pass_field" with "abc"
  And I press "Sign up"
  Then a user with the name "account1" with a password "abc" should not exist
  

# Scenario:
