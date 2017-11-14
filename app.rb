require 'bundler'
Bundler.require
require 'tilt/erb'
require 'sinatra/activerecord'
require './db/models/model.rb'

# Radical ad tracking application
class Radical < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  register Sinatra::Flash

  enable :sessions

  set :session_secret, ENV.fetch('SESSION_SECRET')
  set :database, { adapter: 'sqlite3', database: 'radical.sqlite3' }

  # Authentication
  use Warden::Manager do |manager|
    manager.serialize_into_session{ |user| user.id }
    manager.serialize_from_session{ |id| User.find(id) }

    manager.scope_defaults :default, strategies: [:password], action: '/unauthenticated'
    manager.failure_app = self
  end

  Warden::Manager.before_failure do |env, opts|
    env['REQUEST_METHOD'] = 'POST'
    env.each do |key, value|
      env[key]['_method'] = 'post' if key == 'rack.request.form_hash'
    end
  end

  Warden::Strategies.add(:password) do
    def valid?
      params['user'] && params['user']['email'] && params['user']['password']
    end

    def authenticate!
      user = User.find_by(email: params['user']['email'])
      if user.nil?
        throw(:warden, message: 'Log in failed')
      elsif user.authenticate(params['user']['password'])
        success!(user)
      else
        throw(:warden, message: 'Log in failed')
      end
    end
  end

  get '/' do
    haml :index
  end

  require_relative 'routes/agents'
  require_relative 'routes/accounts'
  require_relative 'routes/ads'
  require_relative 'routes/ad_groups'
  require_relative 'routes/auth'

  require_relative 'helpers/helpers'

  register Sinatra::Radical::Routing::Agents
  register Sinatra::Radical::Routing::Accounts
  register Sinatra::Radical::Routing::Ads
  register Sinatra::Radical::Routing::AdGroups
  register Sinatra::Radical::Routing::Authentication

  helpers Sinatra::DateHelper

end
