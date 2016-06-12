source 'https://rubygems.org'
ruby "2.2.2"

gem 'sinatra', require: 'sinatra/base'
gem 'sinatra-asset-pipeline', require: 'sinatra/asset_pipeline'

gem 'uglifier'
gem 'therubyracer', platform: :ruby
gem 'slim'
gem 'coffee-script'

group :development, :test do
  gem 'sinatra-contrib'
  gem 'foreman'
  gem 'rubocop'

  # Test
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'poltergeist'
  gem 'factory_girl'
end

group :test do
  gem 'codeclimate-test-reporter', require: false
end

