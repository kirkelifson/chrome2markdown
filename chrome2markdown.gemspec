Gem::Specification.new do |s|
  s.name        = 'chrome2markdown'
  s.version     = '0.0.1'
  s.date        = '2015-01-17'
  s.summary     = 'Chrome 2 Markdown'
  s.description = 'Converts specified folder of links from exported Google Chrome bookmarks into markdown.'
  s.authors     = ['Kirk Elifson']
  s.email       = 'kirk@parodybit.net'
  s.files       = ['lib/chrome2markdown.rb']
  s.homepage    = 'https://rubygems.org/gems/chrome2markdown'
  s.license     = 'MIT'

  # Dependencies
  s.add_dependency 'nokogiri', '~> 1.6'
end
