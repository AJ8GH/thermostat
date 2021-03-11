require 'sinatra/base'

class ThermostatApp < Sinatra::Base
  configure do
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
  end

  get '/' do
    File.read('public/index.html')
  end
end
