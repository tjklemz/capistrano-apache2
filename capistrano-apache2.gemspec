# -*- encoding: utf-8 -*-

# Based on capistrano-nginx by Ivan Tkalin
# Modifications by Thomas Klemz

require File.expand_path('../lib/capistrano/apache2/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Thomas Klemz"]
  gem.email         = ["tjklemz@gmail.com"]
  gem.description   = "Simple apache2 management with capistrano"
  gem.summary       = "Configuration and managements capistrano tasks for apache2"
  gem.homepage      = "https://github.com/tjklemz/capistrano-apache2"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "capistrano-apache2"
  gem.require_paths = ["lib"]
  gem.version       = Capistrano::Apache2::VERSION
end
