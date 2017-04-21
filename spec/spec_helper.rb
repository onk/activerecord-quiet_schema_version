$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "activerecord/quiet_schema_version"

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.filter_run_when_matching :focus
  config.order = :random
  Kernel.srand config.seed
end
