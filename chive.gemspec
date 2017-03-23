$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "chive/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "chive"
  s.version     = Chive::VERSION
  s.authors     = ["Fred Snyder"]
  s.email       = ["fsnyder@castwide.com"]
  s.homepage    = "http://castwide.com"
  s.summary     = "Mountable article engine"
  s.description = "A mountable engine for blogging and article publishing."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2", ">= 4.2.6"

  s.add_development_dependency "sqlite3", "~> 1.3"
end
