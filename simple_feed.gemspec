# -*- encoding: utf-8 -*-
require File.expand_path('../lib/simple_feed/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Matt Yoho"]
  gem.email         = ["mby@mattyoho.com"]
  gem.description   = %q{Client gem for the SimpleFeed service}
  gem.summary       = %q{Client gem for the SimpleFeed service}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "simple_feed"
  gem.require_paths = ["lib"]
  gem.version       = SimpleFeed::VERSION

  gem.add_runtime_dependency 'faraday'
  gem.add_development_dependency 'rspec'
end
