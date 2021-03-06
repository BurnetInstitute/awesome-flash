$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "awesome-flash/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "awesome-flash"
  s.version     = AwesomeFlash::VERSION
  s.authors     = ["Dyson Simmons"]
  s.email       = ["dyson@dysonsimmons.com.au"]
  s.homepage    = "http://dysonsimons.com"
  s.summary     = "AwesomeFlash flash messages."
  s.description = "AwesomeFlash allows the setting and retrieving of flash messages for HTML display using the Twitter Bootstrap markup."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 4.0", "<= 6.0"
end
