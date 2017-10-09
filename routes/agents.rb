# Agent Route
module Sinatra
  module Radical
    module Routing
      module Agents
        def self.registered(app)

          app.get '/agents' do
            @users = User.all

            haml :show_agents
          end

          app.get '/agents/:name' do
            env['warden'].authenticate!
            @user = User.find_by(name: params[:name])
            @ad_groups = @user.ad_groups

            haml :show_agent_ads
          end

        end
      end
    end
  end
end
