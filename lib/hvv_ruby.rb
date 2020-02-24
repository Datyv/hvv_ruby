require 'hvv_ruby/check_name'
require 'hvv_ruby/departure_list'
require 'hvv_ruby/request'

module HvvRuby
  class << self
    # query
    attr_accessor :gti
    attr_accessor :gti_base_url
    attr_accessor :gti_username
    attr_accessor :gti_password
    attr_accessor :gti_version

    def setup
      yield self
    end

    def departures(station_name)
      HvvRuby::DepartureList.new(station_name).pull
    end

    def station_info(station_name)
      HvvRuby::CheckName.new(station_name).pull
    end
  end
end
