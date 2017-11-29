# Authentication Route
module Sinatra
  module Radical
    module Routing
      module Authentication
        def self.registered(app)

          app.get '/login' do
            haml :login
          end

          app.post '/login' do
            env['warden'].authenticate!

            if session[:return_to].nil?
              redirect "/"
            else
              redirect session[:return_to]
            end
          end

          app.post '/unauthenticated' do
            session[:return_to] = env['warden.options'][:attempted_path] if session[:return_to].nil?
            flash[:error] = env['warden.options'][:message] || 'You must log in'
            redirect '/login'
          end

          app.get '/logout' do
            session.destroy
            redirect '/'
          end

        end
      end
    end
  end
end
