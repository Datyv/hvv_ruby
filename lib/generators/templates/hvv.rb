HvvRuby.setup do |config|
  config.gti_base_url = "https://api-prod.geofox.de/"
  config.gti_username = ENV['HVV_USERNAME']
  config.gti_password = ENV['HVV_PASSWORD']
  config.gti_version = '37'
end
