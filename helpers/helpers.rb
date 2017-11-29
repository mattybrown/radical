# Helpers module
require 'sinatra/base'

module Sinatra
  module DateHelper

    def valid_date?(string)
      return true if string == 'never'

      !!(string.match(/\d{4}-\d{2}-\d{2}/) && Date.strptime(string, '%Y-%m-%d'))
      rescue ArgumentError
        false
    end

    def format_date(date)
      date.strftime('%d/%m/%y')
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

end
