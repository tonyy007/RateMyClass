require 'digest'



Then /^(?:|I )should be on the (.+)$/ do |page_name|
  visit path_to(page_name)
end