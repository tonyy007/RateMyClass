source 'https://rubygems.org'

ruby '3.0.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'
gem 'digest'
gem "sprockets", "~> 3.7.2" 

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console'
end

group :test do
  gem 'cucumber-rails', :require => false
  gem 'rspec-rails'
  gem 'webmock'
  gem 'capybara', '3.1'
  gem 'rack-test', '0.6.3'
  gem 'rack_session_access', '0.1.1'
end
gem "puma", "~> 5.5"
gem 'pg'
gem 'actionview'
gem 'simplecov', require: false, group: :test