# require 'active_support/core_ext'
# require 'rspec'

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'hvv_ruby'

HvvRuby.setup do |config|
  config.gti_base_url = "https://api-prod.geofox.de/"
  config.gti_username = ENV['HVV_USERNAME']
  config.gti_password = ENV['HVV_PASSWORD']
  config.gti_version = '37'
end

RSpec.configure do |config|
  config.color = true
end
