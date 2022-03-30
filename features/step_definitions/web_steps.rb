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

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end

When /^(?:|I )check "([^\"]*)"$/ do |field|
  choose(field)
end

Then /^(?:|I )should be on the (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
    puts current_path
  end
end

Then /^(?:|I )should see "([^\"]*)"$/ do |text|
  page.should have_content(text)
end

Then /^(?:|I )should not see "([^\"]*)"$/ do |text|
  page.should_not have_content(text)
end


When /^(?:|I )select "([^"]*)" from "([^"]*)"$/ do |value, options|
  select value, :from => options
end



Given /^I am logged in as "([^"]*)" with password "([^\"]*)"$/ do |username, password|
    step %{I go to the login page}
    step %{I fill in "user_field" with "#{username}"}
    step %{I fill in "pass_field" with "#{password}"}
    step %{I press "Log in"}
end

Given /^I am logged in as an admin "([^"]*)" with password "([^\"]*)"$/ do |username, password|
    step %{I go to the signup page}
    step %{I fill in "user_field" with "#{username}"}
    step %{I fill in "pass_field" with "#{password}"}
    step %{I select "admin" from "typeofuser"}
    step %{I press "Sign up"}
    step %{I fill in "adminpass_field" with "rmcadmin452319809238"}
    step %{I press "Submit"}
end

Given /^I am logged in as a student "([^"]*)" with password "([^\"]*)"$/ do |username, password|
    step %{I go to the signup page}
    step %{I fill in "user_field" with "#{username}"}
    step %{I fill in "pass_field" with "#{password}"}
    step %{I select "student" from "typeofuser"}
    step %{I press "Sign up"}
end

Given /^I am logged in as a professor "([^"]*)" with password "([^\"]*)"$/ do |username, password|
    step %{I go to the signup page}
    step %{I fill in "user_field" with "#{username}"}
    step %{I fill in "pass_field" with "#{password}"}
    step %{I select "professor" from "typeofuser"}
    step %{I press "Sign up"}
end


# Then /^the "([^"]*)" field(?: within (.*))? should contain "([^"]*)"$/ do |field, parent, value|
#   with_scope(parent) do
#     field = find_field(field)
#     field_value = (field.tag_name == 'textarea') ? field.text : field.value
#   end
# end

When /^I reload the page$/ do
  visit [ current_path, page.driver.request.env['QUERY_STRING'] ].reject(&:blank?).join('?')
end

And /^(?:|I )want to open$/ do
    save_and_open_page
end