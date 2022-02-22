require 'digest'

Then /^I should not be on the reviews page$/ do
  current_path.should_not == path_to('reviews page')
end