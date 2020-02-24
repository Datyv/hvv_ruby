require 'net/http'
require 'base64'
require 'cgi'
require 'openssl'
require 'json'

module HvvRuby
  class Request
    attr_accessor :response, :content

    GTI_ROUTES = {
      init: '/gti/public/init',
      check_name: '/gti/public/checkName',
      get_route: '/gti/public/getRoute',
      departure_list: '/gti/public/departureList',
      get_tariff: '/gti/public/getTariff',
      departure_course: '/gti/public/departureCourse',
      list_stations: '/gti/public/listStations',
      listlines: '/gti/public/listLines',
      get_announcements: '/gti/public/getAnnouncements',
      check_postal_code: '/gti/public/checkPostalCode',
      get_vehicle_map: '/gti/public/getVehicleMap',
      get_track_coordinates: '/gti/public/getTrackCoordinates',
      get_individual_route: '/gti/public/getIndividualRoute',
      get_station_information: '/gti/public/getStationInformation',
      tariff_meta_data: '/gti/public/tariffMetaData',
      single_ticket_optimizer: '/gti/public/singleTicketOptimizer',
      ticket_list: '/gti/public/ticketList'
    }.freeze

    def initialize(path_key, params = '')
      real_path = GTI_ROUTES[path_key.to_sym]
      @uri = URI("#{HvvRuby.gti_base_url}#{real_path}#{params}")
    end

    def post(payload = {})
      request = Net::HTTP::Post.new(@uri)
      request.body = payload.to_json
      request = add_auth(request)

      @response = Net::HTTP.start(@uri.hostname, @uri.port, use_ssl: @uri.scheme == 'https') do |http|
        http.request(request)
      end
      @content = JSON.parse(@response.body)
      self
    end

    private

    def add_auth(request)
      hmac = OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha1'), HvvRuby.gti_password.encode("UTF-8"), request.body.to_s)
      signature = Base64.encode64(hmac).chomp

      request['geofox-auth-user'] = HvvRuby.gti_username
      request['geofox-auth-signature'] = signature
      request['geofox-auth-type'] = 'HmacSHA1'
      request['Accept'] = 'application/json'
      request['Content-type'] = 'application/json'

      request
    end
  end
end
