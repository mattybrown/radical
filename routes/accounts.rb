# Accounts routes
module Sinatra
  module Radical
    module Routing
      module Accounts
        def self.registered(app)

          app.get '/accounts' do
            @ad_groups = AdGroup.all

            haml :show_accounts_ads
          end

        end
      end
    end
  end
end
