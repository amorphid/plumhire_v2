# This file is copied to spec/ when you run "rails generate rspec:install"
ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
require "rspec/rails"
require "rspec/autorun"
require "capybara/rspec"

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.infer_base_class_for_anonymous_controllers = false

  # runs tests in random order
  config.order = "random"

  # database_cleaner config (start)
    config.use_transactional_fixtures = false
    config.before(:suite) { DatabaseCleaner.clean_with(:truncation) }
    config.before(:each)  { DatabaseCleaner.strategy = :transaction }
    config.before(
      :each,
      :js => true)       { DatabaseCleaner.strategy = :truncation }
    config.before(:each) { DatabaseCleaner.start                  }
    config.after(:each)  { DatabaseCleaner.clean                  }
  # database_cleaner config (end)
end
