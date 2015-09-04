# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'changeful/version'

Gem::Specification.new do |spec|
  spec.name          = "changeful"
  spec.version       = Changeful::VERSION
  spec.authors       = ["Wayne Tng"]
  spec.email         = ["wayne@futureworkz.com"]

  spec.summary       = %q{Make your static contents editable in database}
  spec.description   = %q{Changeful is a gem that converts your static content in your views to be stored into database. Thereafter, administrator can use RailsAdmin or Active Admin to edit the static content.}
  spec.homepage      = "https://github.com/futureworkz/changeful"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", "> 4.2.0"

  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "generator_spec"
  spec.add_development_dependency "shoulda-matchers"
end
