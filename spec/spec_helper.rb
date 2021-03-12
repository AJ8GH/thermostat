require 'capybara'
require 'capybara/rspec'
require 'rspec'

require_relative '../app'
require_relative '../lib/database_connection'
require_relative '../lib/thermostat'

ENV['RACK_ENV'] = 'test'

Capybara.app = ThermostatApp
Capybara.server = :puma, { Silent: true }
Capybara.default_driver = :selenium

RSpec.configure do |config|
  config.before(:each) { Thermostat.renew }
end
