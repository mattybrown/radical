require 'tilt/erb'
require 'sinatra/activerecord'
require './db/models/model.rb'

# Radical ad tracking application
class Radical < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  enable :sessions

  set :session_secret, ENV.fetch('SESSION_SECRET')
  set :database, { adapter: 'sqlite3', database: 'radical.sqlite3' }

  require_relative 'routes/agents'
  require_relative 'routes/accounts'

  register Sinatra::Radical::Routing::Agents
  register Sinatra::Radical::Routing::Accounts

end
