# Ad Categories routes
module Sinatra
  module Radical
    module Routing
      module AdCategories
        def self.registered(app)

          app.get '/adcategory/create' do
            env['warden'].authenticate!
            access_level(3)

            haml :create_ad_category
          end

          app.post '/adcategory/create' do
            env['warden'].authenticate!
            access_level(3)

            if params[:adcategory]
              a = AdCategory.create(
                name: params[:adcategory][:name],
                price: params[:adcategory][:price],
                company_paid: params[:adcategory][:company_pays]
              )
              if a.save
                flash[:success] = 'Ad Category successfully created'
                redirect back
              else
                flash[:error] = 'There was an error creating ad category'
                redirect back
              end
            end
          end

        end
      end
    end
  end
end
