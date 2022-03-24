Feature: Destroy, edit, and flag comment
  
As a student  
Create, edit, delete a comment

As a professor
Look at comments

 

Background:
  Given I am logged in as a student "dummystudent1" with password "dummystudent1"
  Given the following reviews exist:
  | course_title | course_code | professor_name   | university_name        | workTime | studyTime | diffculty          | timeWish        | thought        | users_id      |
  | csce         | 121         | Robert Lightfoot | Texas A&M University   | 10       | 5         | review_diffculty_4 | 10              | Easy Class     | dummystudent1 |
  
  
Scenario: Creating a comment on a review that exists
  Given I go to homepage
  When I fill in "search_field" with "CSCE 121"
  And I press "Search"
  And I go to the indexupper page
  And I follow the first link "Show"
  And I fill in "comment_body" with "Test Comment."
  And I press "Create Comment"
  Then I should see "Test Comment."
  
Scenario: Destory an existing comment
  Given I go to homepage
  When I fill in "search_field" with "CSCE 121"
  And I press "Search"
  Then I should be on the indexupper page
  And I follow the first link "Show"
  And I fill in "comment_body" with "Test Comment 2."
  And I press "Create Comment"
  And I press "Destroy Comment"
  Then I should not see "Test Comment 2."
  
Scenario: Flagging a comment on a review
  Given I go to homepage
  When I fill in "search_field" with "CSCE 121"
  And I press "Search"
  Then I should be on the indexupper page
  And I follow the first link "Show"
  And I fill in "comment_body" with "Test Comment 2."
  And I press "Create Comment"
  And I follow "white_flag_comment"
  
Scenario: UnFlagging a comment on a review
  Given I go to homepage
  When I fill in "search_field" with "CSCE 121"
  And I press "Search"
  Then I should be on the indexupper page
  And I follow the first link "Show"
  And I fill in "comment_body" with "Test Comment 2."
  And I press "Create Comment"
  And I follow "white_flag_comment"
  Given I am logged in as an admin "dummyadmin1" with password "dummyadmin1"
  When I fill in "search_field" with "CSCE 121"
  And I press "Search"
  Then I should be on the indexupper page
  And I follow the first link "Show"
  And I follow "yellow_flag_uncomment"
