# Agent Route
module Sinatra
  module Radical
    module Routing
      module Agents
        def self.registered(app)

          app.get '/agents' do
            @users = User.all
          end

          app.get '/agents/:name' do
            @user = User.find_by(name: params[:name])
            @ad_groups = @user.ad_groups

            haml :show_agent_ads
          end

        end
      end
    end
  end
end
