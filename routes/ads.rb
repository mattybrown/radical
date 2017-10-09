# Ads routes
module Sinatra
  module Radical
    module Routing
      module Ads
        def self.registered(app)

          app.get '/ad/create/:ad_group/' do
            @ad_group = AdGroup.find_by(canonical: params[:ad_group])
            @ad_categories = AdCategory.where(company_paid: false)
            haml :create_ad
          end

          app.post '/ad/create' do
            if params[:ad]
              ad_group = AdGroup.find(params[:ad][:ad_group])
              ad_number = ad_group.ads.count + 1
              reference = ad_group.listing_number.to_s + "." + ad_number.to_s
              params[:ad][:vendor_pays] == "on" ? v = true : v = false
              a = Ad.create(
                name: params[:ad][:name],
                description: params[:ad][:description],
                deadline: Date.parse(params[:ad][:deadline]),
                run_date: Date.parse(params[:ad][:rundate]),
                vendor_pays: v,
                reference: reference,
                ad_group_id: params[:ad][:ad_group],
                ad_category_id: params[:ad][:category]
              )
              if a.save
                redirect "/agents"
              else
                redirect back
              end
            end
          end

        end
      end
    end
  end
end
