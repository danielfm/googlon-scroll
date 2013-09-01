# -*- encoding: utf-8 -*-
require File.expand_path('../lib/googlon-scroll/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Daniel Martins']
  gem.email         = ['daniel.tritone@gmail.com']
  gem.license       = 'BSD'
  gem.homepage      = 'http://github.com/danielfm/googlon-scroll'
  gem.description   = "Generates random programming quizzes like the ones created by Google for Google Developer Day 2011"
  gem.summary       = "Random programming quiz generator"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = 'googlon-scroll'
  gem.require_paths = ['lib']
  gem.version       = GooglonScroll::VERSION

  gem.add_development_dependency 'debugger'
  gem.add_development_dependency 'rspec', '~> 2.12.0'
end
