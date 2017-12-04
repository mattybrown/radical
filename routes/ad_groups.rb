# Ads routes
module Sinatra
  module Radical
    module Routing
      module AdGroups
        def self.registered(app)

          app.get '/adgroup/create' do
            env['warden'].authenticate!
            access_level(3)

            @agents = User.where(role_id: 4)
            haml :create_ad_group
          end

          app.post '/adgroup/create' do
            if params[:adgroup]
              name = params[:adgroup][:name]
              can = name.delete(' ')
              g = AdGroup.create(
                name: name,
                canonical: can,
                listing_number: params[:adgroup][:listing_number],
                budget: params[:adgroup][:vendor_budget],
                agent_budget: params[:adgroup][:agent_budget],
                paid: false,
                user_id: params[:adgroup][:agent]
              )
              if g.save
                flash[:success] = 'Ad group successfully created'
                redirect back
              else
                flash[:error] = 'There was an error creating ad group'
                redirect back
              end
            end
          end

          app.get '/adgroup/edit/:id' do
            @adgroup = AdGroup.find(params[:id])
            haml :edit_ad_group
          end

          app.post '/adgroup/update' do
            if params[:adgroup]
              adgroup = AdGroup.find(params[:adgroup][:id])
              if adgroup.update(
                name: params[:adgroup][:name],
                listing_number: params[:adgroup][:listing_number],
                budget: params[:adgroup][:vendor_budget],
                agent_budget: params[:adgroup][:agent_budget]
              )
                flash[:success] = 'Ad Group Updated'
                redirect '/agents'
              else
                flash[:error] = "Ad group failed to update"
                redirect back
              end
            end
          end

          app.get '/adgroup/delete/:id' do
            adgroup = AdGroup.find(params[:id])
            if adgroup
              adgroup.destroy
              flash[:success] = "Ad Group successfully deleted"
              redirect back
            else
              flash[:error] = "That Ad Group does not exist..."
              redirect back
            end
          end

        end
      end
    end
  end
end
