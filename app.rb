require 'json'
require 'sinatra/base'
require_relative 'lib/thermostat'

class ThermostatApp < Sinatra::Base
  configure do
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
  end

  get '/' do
    File.read('public/index.html')
  end

  get '/temperature' do
    p thermostat = Thermostat.instance
    p temperature = thermostat.temperature
    { temperature: temperature }.to_json
  end

  post '/temperature' do
    thermostat = Thermostat.instance
    p params
    p params[:temperature]
    p thermostat.temperature
    thermostat.update_temperature(params[:temperature].to_i)
    p thermostat.temperature
    { status: 200 }.to_json
  end
end
