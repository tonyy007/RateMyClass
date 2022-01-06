Feature: login

  As a user on RateMyClass
  So that I can access the homepage
  I want to be able to log in to the website

Scenario: login with a valid username and password

  Given I login with username "Tim" and password "p123"
  When I click "Log in"
  Then I should see "homepage"