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
    {
      temperature: @thermostat.temperature,
      city: @thermostat.city,
      psm: @thermostat.psm
    }.to_json
  end

  post '/temperature' do
    @thermostat.update_settings(
      temperature: params[:temperature].to_i,
      psm: params[:psm],
      city: params[:city]
    )
    { status: 200 }.to_json
  end
end
