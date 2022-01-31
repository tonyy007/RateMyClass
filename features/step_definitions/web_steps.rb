require 'uri'
require 'cgi'

When /^(?:|I )go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

# @password = Digest::SHA256.hexdigest ______