# -*- encoding: utf-8 -*-
Gem::Specification.new do |gem|
  gem.authors       = ['Matteo Centenaro']
  gem.email         = ['bugant@gmail.com']
  gem.description   = %q{Log Exception raised from a Rack app in JSON format}
  gem.summary       = %q{Log Exception raised from a Rack app in JSON format}
  gem.homepage      = 'https://github.com/FunGoStudios/json-exception'

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = 'json-exception'
  gem.require_paths = ['lib']
  gem.version       = '0.1.0'

  gem.add_dependency 'rack'
  gem.add_dependency 'yajl-ruby'
  gem.add_development_dependency 'bundler'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'debugger'
end
