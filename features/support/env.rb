require 'httparty'
require "httparty/request"
require "httparty/response/headers"
require 'rspec'
require 'pry'
require 'yaml'
require "cucumber"
require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'test/unit/assertions'
require 'faker'
require 'json'

include Test::Unit::Assertions

EL = YAML.load_file('./data/elements.yml')
PAY = YAML.load_file('./data/payloads.yml')
BASE_URL = YAML.load_file('./data/endpoints.yml')

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.configure do |config|
  config.default_driver = :selenium
end

Capybara.page.driver.browser.manage.window.maximize

Capybara.default_max_wait_time = 15
