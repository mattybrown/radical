# Helpers module
require 'sinatra/base'

module Sinatra
  module DateHelper

    def valid_date?(string)
      begin
        Date.parse(string)
      rescue ArgumentError
      end
    end

    def format_date(date)
      date.strftime('%d/%m/%Y')
    end

    def this_fri
      d = Date.today
      while d.wday != 5
        d = d + 1
      end
      return d
    end

    def this_sat
      d = Date.today
      while d.wday != 6
        d = d + 1
      end
      return d
    end

  end

  module AccessHelper

    def access_level(level)
      if env['warden'].user.role.access_level > level
        redirect '/'
      end
    end

    def privileged(level)
      env['warden'].user.role.access_level > level
    end

  end

  module PathHelper

    def active_page?(path='')
      request.path_info == '/' + path
    end

  end

end
