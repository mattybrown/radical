# Ads routes
module Sinatra
  module Radical
    module Routing
      module Ads
        def self.registered(app)

          app.get '/ads' do
            @ads = Ad.all
            haml :show_ads
          end

          app.get '/ad/create/:ad_group/' do
            env['warden'].authenticate!

            @ad_group = AdGroup.find_by(canonical: params[:ad_group])
            privileged(3) ? @ad_categories = AdCategory.where(company_paid: false) : @ad_categories = AdCategory.all

            haml :create_ad
          end

          app.post '/ad/create' do
            if params[:ad]
              valid_date?(params[:ad][:deadline]) ? dl = Date.parse(params[:ad][:deadline]) : dl = Date.today
              valid_date?(params[:ad][:rundate]) ? rd = Date.parse(params[:ad][:rundate]) : rd = Date.today

              ad_group = AdGroup.find(params[:ad][:ad_group])
              ad_category = AdCategory.find(params[:ad][:category])
              ad_number = ad_group.ads.count + 1
              reference = ad_group.listing_number.to_s + "." + ad_number.to_s

              vendor_ad_cost = 0
              agent_ad_cost = 0
              ad_group.ads.each do |a|
                if a.vendor_pays
                  vendor_ad_cost += a.ad_category.price
                else
                  agent_ad_cost += a.ad_category.price
                end
              end

              # check to make sure the vendor/agent has enough remaining credit in budget
              in_budget = true
              params[:ad][:vendor_pays] == "on" ? v = true : v = false
              if v
                if ad_group.budget - (vendor_ad_cost + ad_category.price) < 0
                  in_budget = false
                end
              else
                if ad_group.agent_budget - (agent_ad_cost + ad_category.price) < 0
                  in_budget = false
                end
              end

              if in_budget
                a = Ad.create(
                  name: params[:ad][:name],
                  description: params[:ad][:description],
                  deadline: dl,
                  run_date: rd,
                  vendor_pays: v,
                  reference: reference,
                  ad_group_id: params[:ad][:ad_group],
                  ad_category_id: params[:ad][:category]
                )
                if a.save
                  flash[:success] = "Ad created"
                  redirect "/"
                else
                  flash[:error] = "Error: ad creation failed"
                  redirect back
                end
              else
                flash[:error] = "There is not enough money left in the budget for this ad. Please see admin."
                redirect "/agents"
              end
            end
          end

          app.get '/ad/delete/:id' do
            a = Ad.find(params[:id])

            if a.destroy
              flash[:success] = "Ad Deleted"
              redirect back
            else
              flash[:error] = "The ad was unable to be deleted"
              redirect back
            end
          end

          app.get '/ad/edit/:id' do
            @ad = Ad.find(params[:id])
            @ad_categories = AdCategory.where(company_paid: false)

            haml :edit_ad
          end

          app.post '/ad/edit' do
            if params[:ad]
              a = Ad.find(params[:ad][:id])
              valid_date?(params[:ad][:deadline]) ? dl = Date.parse(params[:ad][:deadline]) : dl = Date.today
              valid_date?(params[:ad][:rundate]) ? rd = Date.parse(params[:ad][:rundate]) : rd = Date.today

              ad_group = AdGroup.find(params[:ad][:ad_group])
              ad_number = ad_group.ads.count + 1
              reference = ad_group.listing_number.to_s + "." + ad_number.to_s

              params[:ad][:vendor_pays] == "on" ? v = true : v = false
              params[:ad][:category] == nil ? ac = a.ad_category_id : ac = params[:ad][:category]

              if a.update(
                name: params[:ad][:name],
                description: params[:ad][:description],
                deadline: dl,
                run_date: rd,
                vendor_pays: v,
                reference: reference,
                ad_group_id: params[:ad][:ad_group],
                ad_category_id: ac
              )
                flash[:success] = "Ad updated"
                redirect "/agents"
              else
                flash[:error] = "Error: ad save failed"
                redirect back
              end

            end
          end

          app.post '/ad/package/create' do
            if params[:ad]
              h = params.select{|k,v| k.include? "ad"}
              g = h.shift
              group = g[1]["ad_group"].to_i
              h.each do |ad|
                a = Ad.new(
                  name: ad[1]["name"],
                  description: "Package generated",
                  deadline: ad[1]["rundate"],
                  run_date: ad[1]["rundate"],
                  vendor_pays: true,
                  reference: reference,
                  ad_group_id: group,
                  ad_category_id: params[:ad][:category]
                )
              end
              flash[:notice] = group
              redirect back
            end
          end

        end
      end
    end
  end
end
