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

  end
end
