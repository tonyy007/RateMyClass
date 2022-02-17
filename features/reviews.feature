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

Scenario: Creating a new review
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
  # Then a review with "review_course_title", "review_course_code", "review_professor_name", "review_university_name", "review_workTime", "review_studyTime", "review_diffculty_4", "review_timeWish" exists
  

