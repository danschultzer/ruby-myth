Gem::Specification.new do |s|
  s.name      = 'myth'
  s.version   = '1.0.2'
  s.date      = '2014-08-23'

  s.homepage    = "http://github.com/danschultzer/ruby-myth"
  s.summary     = "Ruby Myth Preprocessor"
  s.description = <<-EOS
    Ruby Myth is a bridge to the CSS Myth preprocessor.
  EOS

  s.files = [
    'lib/myth.rb',
    'LICENSE',
    'README.md'
  ]

  s.add_dependency 'myth-source', '>= 0.3.0'
  s.add_dependency 'execjs'
  s.add_development_dependency 'json'
  s.add_development_dependency 'rake'

  s.authors = ['Dan Schultzer']
  s.email   = 'dan@dreamconception.com'
  s.license = "MIT"
end
