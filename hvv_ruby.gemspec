$:.push File.expand_path("../lib", __FILE__)

require "hvv_ruby/version"

Gem::Specification.new do |s|
  s.name        = "hvv_ruby"
  s.version     = HvvRuby::VERSION
  s.authors     = ["Yves Goizet"]
  s.email       = ["yvesgoizet@gmail.com"]
  s.summary     = "A wrapper for the Geofox-Api. Get routes, station, etc."
  s.description = "A wrapper for the Geofox-Api. Get routes, station, etc."

  s.files = Dir["{lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.add_development_dependency "rspec"
end
