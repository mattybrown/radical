# Admin routes
module Sinatra
  module Radical
    module Routing
      module Admin
        def self.registered(app)

          app.get '/admin' do
            env['warden'].authenticate!
            access_level(3)

            @ad_groups = AdGroup.order(created_at: :desc)
            haml :admin
          end

          app.get '/admin/adgroups' do
            env['warden'].authenticate!
            access_level(3)

            @ad_groups = AdGroup.order(created_at: :desc)
            haml :show_admin_adgroups
          end

          app.get '/admin/adgroup/:listing' do
            env['warden'].authenticate!
            access_level(3)

            @adgroup = AdGroup.where(listing_number: params[:listing]).last
            haml :show_admin_adgroup_listing
          end

          app.get '/admin/adcategories' do
            env['warden'].authenticate!
            access_level(3)

            @ad_categories = AdCategory.all
            haml :show_admin_adcategories
          end

          app.get '/admin/users' do
            env['warden'].authenticate!
            access_level(3)

            @users = User.all
            haml :show_admin_users
          end

          app.get '/admin/package/:adgroup/:package' do
            env['warden'].authenticate!
            access_level(3)

            @ad_group = AdGroup.where(listing_number: params[:adgroup]).first

            if params[:package] == "1"
              @package = "Premium"
              @fullpage = "0"
              @halfpage = "3"
              @quarterpage = "3"
            elsif params[:package] == "2"
              @package = "Premium Plus"
              @fullpage = "0"
              @halfpage = "3"
              @quarterpage = "2"
            elsif params[:package] == "3"
              @package = "Platinum"
              @fullpage = "1"
              @halfpage = "3"
              @quarterpage = "2"
            elsif params[:package] == "4"
              @package = "Platinum Plus"
              @fullpage = "1"
              @halfpage = "4"
              @quarterpage = "3"
            end

            haml :show_admin_packages
          end

        end
      end
    end
  end
end
