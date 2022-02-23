require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

When /^(?:|I )go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

# Fill in a string
When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^(?:|I )follow "([^"]*)"$/ do |link|
  click_link(link)
end


When /^(?:|I )follow the first link "([^"]*)"$/ do |link|
  first(:link, link).click
end

When /^(?:|I )press the button "([^"]*)"$/ do |button|
  %{I press (button)}
end


# Fill in a numeric value
# When /^(?:|I )fill in "([^"]*)" with ([^"]*)$/ do |field, value|
#   fill_in(field, :with => value)
# end

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end

When /^(?:|I )check "([^\"]*)"$/ do |field|
  choose(field)
end

Then /^(?:|I )should be on the (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then /^(?:|I )should see "([^"]]*)$/ do |text|
  page.should have_content(text)
end

Then /^(?:|I )should not see "([^"]]*)$/ do |text|
  page.should_not have_content(text)
end

Given /^I am logged in as "([^"]*)" with password "([^\"]*)"$/ do |username, password|
    step %{I go to the login page}
    step %{I fill in "user_field" with "#{username}"}
    step %{I fill in "pass_field" with "#{password}"}
    step %{I press "Log in"}
end


# Then /^the "([^"]*)" field(?: within (.*))? should contain "([^"]*)"$/ do |field, parent, value|
#   with_scope(parent) do
#     field = find_field(field)
#     field_value = (field.tag_name == 'textarea') ? field.text : field.value
#   end
# end