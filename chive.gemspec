$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "chive/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "chive"
  spec.version     = Chive::VERSION
  spec.authors     = ["Fred Snyder"]
  spec.email       = ["fsnyder@castwide.com"]
  spec.homepage    = "https://castwide.com"
  spec.summary     = "Blog plugin for Rails"
  spec.description = "Blog plugin for Rails"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  spec.files = Dir["{app,config,db,lib,templates}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency 'acts-as-taggable-on', '~> 7.0'
  spec.add_dependency 'bootstrap', '~> 4.6'
  spec.add_dependency 'ckeditor', '~> 5.1'
  spec.add_dependency 'jquery-rails', '~> 4.3'
  spec.add_dependency 'mini_magick', '~> 4.11'
  spec.add_dependency "rails", "~> 6.0.3", ">= 6.0.3.6"
  spec.add_dependency 'will_paginate', '~> 3.3'

  spec.add_development_dependency "sqlite3"
end
