require 'tilt/erb'
require 'sinatra/activerecord'
require './db/models/user_model.rb'

class Radical < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  enable :sessions

  set :session_secret, ENV[session_secret]
  set :database, {adapter: "sqlite3", database: "radical.sqlite3"}

  get '/users' do
    @users = User.all
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    haml :show
  end
end
