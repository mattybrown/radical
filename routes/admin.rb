# Admin routes
module Sinatra
  module Radical
    module Routing
      module Admin
        def self.registered(app)

          app.get '/admin' do
            env['warden'].authenticate!
            access_level(3)

            haml :admin
          end

        end
      end
    end
  end
end
