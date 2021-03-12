require 'json'
require 'sinatra/base'
require_relative 'lib/thermostat'

class ThermostatApp < Sinatra::Base
  before(:all) { thermostat.create }
  before { @thermostat = Thermostat.instance }

  configure do
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
  end

  get '/' do
    File.read('public/index.html')
  end

  get '/temperature' do
    temperature = @thermostat.temperature
    { temperature: temperature }.to_json
  end

  post '/temperature' do
    @thermostat.update_temperature(params[:temperature].to_i)
    { status: 200 }.to_json
  end
end
