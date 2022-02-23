Feature: Users Database of RateMyClass

As an Admin
So that I have the ability to remove/see users
I want to reach the users database


Scenario: I am able to go to the Users Database
  When I go to users database page
  Then I should be on the users database page

Scenario: I am able to create a new User to the Database
  When I go to users database page
  Then I should be on the users database page
  And I follow the first link "New User"
  And I fill in "user_username" with "Account100"
  And I fill in "user_password_hash" with "Account100"
  And I fill in "user_type_of_user" with "admin"
  And I press "Create User"
  Then I should be on the users database page
  
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
  And I follow "Back"

Scenario: I am able to destory the first user
  When I go to users database page
  And I press the button "Destroy"
  # Then I should see a user has been destroyed  # FIXME
  