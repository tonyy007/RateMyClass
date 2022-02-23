require 'digest'


Then /^I should see a user has been destroyed$/ do
  page.should have_content('User was successfully destroyed.')
end