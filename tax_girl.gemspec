lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name             = 'tax_girl'
  s.version          = '0.0.1'
  s.date             = '2015-02-05'
  s.summary          = 'DSL for calculation methods organization.'
  s.description      = 'TaxGirl is a simple tool that helps keeping calculation logic explicit using a ruby DSL.'
  s.authors          = ['Oswaldo Ferreira']
  s.email            = 'oswluizf@gmail.com'
  s.homepage         = 'https://github.com/oswaldoferreira/tax_girl'
  s.license          = 'MIT'

  s.files         = `git ls-files -z`.split("\x0")
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_development_dependency 'bundler', '~> 1.7'
  s.add_development_dependency 'rspec', '~> 3.1', '>= 3.1.0'
end

