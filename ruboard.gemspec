# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboard/version'

Gem::Specification.new do |gem|
  gem.name          = "ruboard"
  gem.version       = Ruboard::VERSION
  gem.authors       = ["Andrew N. Shalaev"]
  gem.email         = ["isqad88@yandex.ru"]
  gem.description   = %q{Best forum engine}
  gem.summary       = %q{Best forum engine for Russia}
  gem.homepage      = "https://github.com/isqad88/ruborad.git"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rspec-rails', '~> 2.6'
  gem.add_development_dependency 'factory_girl_rails', '~> 1.7'

  gem.add_dependency 'rails', ['>= 3.1.10', '< 3.3'] | 0.upto(10).map{|i| "!= 3.2.#{i}"}
  gem.add_dependency 'friendly_id', '~> 4.0', '>= 4.0.9'
  gem.add_dependency 'nested_set', '~> 1.7.1'
end
