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
              params[:adcategory][:company_pays] ? cp = true : cp = false
              params[:adcategory][:mpg_ad] ? ma = true : ma = false
              a = AdCategory.create(
                name: params[:adcategory][:name],
                price: params[:adcategory][:price],
                company_paid: cp,
                mpg_ad: ma
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

          app.get '/adcategory/edit/:id' do
            env['warden'].authenticate!
            access_level(3)

            @adcat = AdCategory.find(params[:id])

            haml :edit_ad_category
          end

          app.post '/adcategory/update' do
            if params[:adcategory]
              adcat = AdCategory.find(params[:adcategory][:id])
              params[:adcategory][:company_pays] ? cp = true : cp = false
              params[:adcategory][:mpg_ad] ? ma = true : ma = false
              if adcat.update(
                name: params[:adcategory][:name],
                price: params[:adcategory][:price],
                company_paid: cp,
                mpg_ad: ma
              )
                flash[:success] = 'Ad Category Updated'
                redirect '/admin/adcategories'
              else
                flash[:error] = "Ad category failed to update"
                redirect back
              end
            end
          end

        end
      end
    end
  end
end
