require_relative "spec_helper"

# Load our exercises so we can test the code we've been playing with

require_relative "../persistence_exercises"
Persistence.reset_with_migration(MIGRATION)
Persistence.finalize

# Set up rom-factory

require "rom-factory"

Factory = ROM::Factory.configure do |config|
  config.rom = Persistence.rom
end

Dir[Pathname(__dir__).join("factories/**/*.rb")].each(&method(:require))

# Clean database between tests

require "database_cleaner"
DatabaseCleaner[:sequel, connection: Persistence.db.connection].strategy = :truncation

RSpec.configure do |config|
  config.before :suite do
    DatabaseCleaner.clean_with :truncation
  end

  config.around :each do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
