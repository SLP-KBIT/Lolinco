require File.dirname(__FILE__) + '/spec_helper'
require 'sinatra'
Sinatra::Application.environment = :test
require File.join(File.dirname(__FILE__), '..', 'app.rb')
disable :run

Capybara.app = Sinatra::Application

