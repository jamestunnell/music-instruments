# -*- encoding: utf-8 -*-

require File.expand_path('../lib/music-instruments/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "music-instruments"
  gem.version       = Music::Instruments::VERSION
  gem.summary       = %q{Base class for creating digital music instruments}
  gem.description   = <<DESCRIPTION
Base classes for creating  digital music instruments.
DESCRIPTION
  gem.license       = "MIT"
  gem.authors       = ["James Tunnell"]
  gem.email         = "jamestunnell@gmail.com"
  gem.homepage      = "https://github.com/jamestunnell/music-instruments"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'hashmake'
  
  gem.add_development_dependency 'bundler', '~> 1.0'
  gem.add_development_dependency 'rake', '~> 0.8'
  gem.add_development_dependency 'rspec', '~> 2.4'
  gem.add_development_dependency 'yard', '~> 0.8'
  gem.add_development_dependency 'micro-optparse'
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'pry-nav'
end
