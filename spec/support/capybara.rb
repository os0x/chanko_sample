require 'capybara/rails'
require 'capybara/dsl'
require 'capybara/node/matchers'
require 'capybara-webkit'

RSpec.configure do |config|
  config.include Capybara::DSL

  config.before :type => :request do
    Headless.new(display: 100, reuse: true, destroy_at_exit: false)
  end
end

Capybara.configure do |config|
  config.default_driver = :webkit
end
