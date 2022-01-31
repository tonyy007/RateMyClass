Feature: Signup Account Creation

As a student
So that I have the ability to post/flag/etc. on RateMyClass
I want to add a student to the RateMyClass database

# Background: users in database
  # Taken from seed data:
  # User.create!({:username => 'cakedaddy69', :password_hash => 'painfullythicc456', :type_of_user => 'student'})
    # Given the following users exist:
    # | username    | password_hash     | type_of_user |
    # | cakedaddy69 | painfullythicc456 | student      |


Scenario: Signup Successful, meeting all required criteria
  When I go to the signup page
  And I fill in "username" with "account1"
  And I fill in "password" with "account1"  # Make sure to hash password
  And I press "Log in"
  Then a user with the name "account1" with a password "account1" exists.  # Make sure to hash password
  
Scenario: Signup Successful, meeting all required criteria
  When I go to the signup page
  And I fill in "username" with "account2"
  And I fill in "password" with "account2"
  And I press "Log in"
  Then a user with the name "account2" with a password "account2" exists.
  

Scenario: Signup Failed, did not meet all required criteria
  When I go to the signup page
  And I fill in "username" with "account1"
  And I fill in "password" with "abc"
  And I press "Log in"
  Then a user with the name "account1" with a password "abc" should not exist.
  

# Scenario:
