# Users Route
module Sinatra
  module Radical
    module Routing
      module Users
        def self.registered(app)

          app.get '/user/create' do
            access_level(3)
            @roles = Role.all

            haml :create_user
          end

          app.post '/user/create' do
            access_level(3)

            if params[:user]
              u = User.create(
                name: params[:user][:first_name],
                last_name: params[:user][:last_name],
                email: params[:user][:email],
                password: params[:user][:password],
                role_id: params[:user][:role]
              )
              if u.save
                flash[:success] = 'User successfully created'
                redirect back
              else
                flash[:error] = 'There was an error creating user'
                redirect back
              end
            end

          end

        end
      end
    end
  end
end
