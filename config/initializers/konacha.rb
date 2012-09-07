if defined?(Konacha) && defined?(Capybara)
  require 'capybara-webkit'
  Konacha.configure do |config|
    config.spec_dir    = "spec/javascripts"
    config.driver      = :webkit
    config.stylesheets = %w(application)
  end
end
