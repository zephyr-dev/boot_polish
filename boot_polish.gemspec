# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'boot_polish/version'

Gem::Specification.new do |gem|
  gem.name          = "boot_polish"
  gem.version       = BootPolish::VERSION
  gem.authors       = ["Rasheed Abdul-Aziz"]
  gem.email         = ["rasheed@pivotallabs.com"]
  gem.description   = %q{Boot time introspection to help you get under the heroku 60 second timeout.}
  gem.summary       = %q{Boot time introspection to help you get under the heroku 60 second timeout.}
  gem.homepage      = "https://github.com/zephyr-dev/boot_polish"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rspec"
  gem.add_development_dependency "pry"
end
