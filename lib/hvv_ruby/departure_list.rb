module HvvRuby
  class DepartureList
    def initialize(station_name, line_name = nil, time = nil)
      @path = 'departure_list'
      @station_name = station_name
      @line_name = line_name
      @parsed_time = time ? Time.parse(time) : Time.now
      build_params
    end

    def build_params
      @parameters = {
        "version": HvvRuby.gti_version,
        "station": find_station,
        "time" => {
          "time" => @parsed_time.strftime('%H:%M'),
          "date" => @parsed_time.strftime('%d.%m.%Y')
        },
        "maxList": 10,
        "maxTimeOffset": 60,
        "useRealtime": true
      }
      self
    end

    def find_station
      HvvRuby::CheckName.new(name: @station_name).pull
    end

    def pull
      response = HvvRuby::Request.new(@path).post(@parameters).content
      response['departures']
    end
  end
end
