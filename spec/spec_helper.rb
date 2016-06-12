require 'rspec'
require 'capybara/rspec'
require 'factory_girl'
require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

Dir[File.dirname(__FILE__) + '/support/**/*.rb'].each { |f| require f }

RSpec.configure do |config|
  require 'capybara/poltergeist'
  Capybara.javascript_driver = :poltergeist
  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app, js_errors: true)
  end

  config.include Capybara::DSL
  config.include FactoryGirl::Syntax::Methods
  config.include WaitForAjax, type: :feature

  config.after :each, js: :true do
    wait_for_ajax
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end

