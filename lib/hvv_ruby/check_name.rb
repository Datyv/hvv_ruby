module HvvRuby
  class CheckName
    def initialize(opts = {})
      @path = 'check_name'
      @name = opts[:name]
      @type = opts[:type] || 'UNKNOWN'
      build_params
    end

    def build_params
      @parameters = {
        "version": HvvRuby.gti_version,
        "theName": {
          "name": @name,
          "type": @type
        },
        "maxList": 1,
        "coordinateType":"EPSG_4326"
      }
      self
    end

    def pull
      response = HvvRuby::Request.new(@path).post(@parameters).content
      response['results'][0]
    end
  end
end
