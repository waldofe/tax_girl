Gem::Specification.new do |s|
  s.name        = 'tax_girl'
  s.version     = '0.0.1'
  s.date        = '2015-02-05'
  s.summary     = 'DSL for calculation methods organization.'
  s.description = 'TaxGirl is a simple tool that helps keeping calculation logic explicit using a ruby DSL.'
  s.authors     = ['Oswaldo Ferreira']
  s.email       = 'oswluizf@gmail.com'
  s.homepage    = 'https://github.com/oswaldoferreira/tax_girl'
  s.license     = 'MIT'

  s.add_development_dependency 'bundler', '~> 1.7'
  add_development_dependency   'rspec', '~> 3.1', '>= 3.1.0'
end