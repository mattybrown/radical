# Agent Route
module Sinatra
  module Radical
    module Routing
      module Agents
        def self.registered(app)

          app.get '/agents' do
            env['warden'].authenticate!
            @users = User.where(role_id: 4)

            haml :show_agents
          end

          app.get '/agents/:name' do
            env['warden'].authenticate!
            n = params[:name].split('.')
            @user = User.find_by(name: n[0], last_name:n[1])
            @ad_groups = @user.ad_groups

            haml :show_agent_ads
          end

        end
      end
    end
  end
end
