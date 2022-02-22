Feature: To be able to create, edit, delete review
  
As a student  
Create, edit, delete a review

As a professor
Look at reviews

Background:
  Given I am logged in as "defaultaccount1" with password "defaultaccount1"
  
  Given the following reviews exist:
  | course_title | course_code | professor_name   | university_name        | workTime | studyTime | diffculty          | timeWish        |
  | csce         | 121         | Robert Lightfoot | Texas A&M University   | 10       | 5         | review_diffculty_4 | 10              |

Scenario: Creating a new review, meets all requirements
  When I go to new reviews page
  And I fill in "review_course_title" with "csce"
  And I fill in "review_course_code" with "121"
  And I fill in "review_professor_name" with "Lightfoot"
  And I fill in "review_university_name" with "Texas A&M University"
  And I fill in "review_workTime" with "30"
  And I fill in "review_studyTime" with "12"
  And I check "review_diffculty_4"
  And I fill in "review_timeWish" with "7"
  And I press "Create Review"
  Then a review with "csce", "121", "Lightfoot", "Texas A&M University", "30", "12", "review_diffculty_4", "7" exists
  
Scenario: Creating a new review, does not meet all requirements
  When I go to new reviews page
  And I fill in "review_course_title" with "csce"
  And I fill in "review_course_code" with "121"
  And I fill in "review_professor_name" with "Lightfoot"
  And I fill in "review_university_name" with "Texas A&M University"
  And I fill in "review_workTime" with "2000"
  And I fill in "review_studyTime" with "1000000"
  And I check "review_diffculty_4"
  And I fill in "review_timeWish" with "-12412"
  And I press "Create Review"
  Then a review with "csce", "121", "Lightfoot", "Texas A&M University", "2000", "1000000", "review_diffculty_4", "-12412" should not exist
  
Scenario: Creating a comment on a review that exists
  Given I go to homepage
  When I fill in "search_field" with "CSCE 121"
  And I press "Search"
  And I go to the indexupper page
  And I follow the first link "Show"
  And I fill in "comment_body" with "Test Comment."
  And I press "Create Comment"
  
Scenario: Edit an existing comment
  Given I go to homepage
  When I fill in "search_field" with "CSCE 121"
  And I press "Search"
  Then I should be on the indexupper page
  And I follow the first link "Show"
  And I fill in "comment_body" with "Test Comment 2."
  And I press "Create Comment"
  And I press "Destroy Comment"
  
  
Scenario: Destory an existing comment
  Given I go to homepage
  When I fill in "search_field" with "CSCE 121"
  And I press "Search"
  Then I should be on the indexupper page
  And I follow the first link "Show"
  And I fill in "comment_body" with "Test Comment 2."
  And I press "Create Comment"
  And I press "Destroy Comment"