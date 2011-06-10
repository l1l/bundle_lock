# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bundle_outdated/version"

Gem::Specification.new do |s|
  s.name        = "bundle_outdated"
  s.version     = BundleOutdated::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Luis Ramos"]
  s.email       = ["lramos85@gmail.com"]
  s.homepage    = "https://github.com/lramos85/bundle_lock"
  s.summary     = %q{Find out current and outdated gems in your gem file and create lock including maven.}
  s.description = %q{Find out current and outdated gems in your gem file and create lock including maven.}

  s.rubyforge_project = "bundle_lock"

  s.add_development_dependency 'builder', '~> 3.0'
  s.add_development_dependency 'rr', '~> 1.0'
  s.required_rubygems_version = ">= 1.6.0"
  

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
