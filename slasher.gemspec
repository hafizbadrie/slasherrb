Gem::Specification.new do |gem|
  gem.name        = 'slasher'
  gem.version     = '0.5.4'
  gem.date        = '2015-08-02'
  gem.summary     = 'Extract the content of an HTML article'
  gem.description = 'This gem could extract the real content of and HTML article based on weight of words in HTML dom nodes.'
  gem.authors     = ['Hafiz Badrie Lubis']
  gem.email       = 'hafizbadrie@gmail.com'
  gem.files       = `git ls-files`.split($\)
  gem.homepage    = 'http://github.com/hafizbadrie/slasherrb'
  gem.license     = 'MIT'

  gem.add_development_dependency 'rspec', '~> 3.2'
  gem.add_development_dependency 'rspec-collection_matchers', '~> 1.1'
  gem.add_development_dependency 'capybara', '~> 2.4'
  gem.add_development_dependency 'pry', '~> 0.10'
  gem.add_runtime_dependency 'nokogiri', '~> 1.6'
end
