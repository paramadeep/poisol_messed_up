Gem::Specification.new do |s|
  s.name = 'poisol'
  s.version = '0.0.2'
  s.date = '2014-11-03'
  s.summary = 'Generate builders for http stubs'
  s.description = "Generate builders for http stubs"
  s.authors = ["Deepak"]
  s.files = Dir['README.md', 'lib/**/*']
  s.test_files = Dir['spec/**/*']
  s.homepage = 'https://github.com/paramadeep/poisol'
  s.license = 'MIT'
  s.add_development_dependency 'rspec', '3.1.0'
  s.add_development_dependency 'rake','10.3.2'
  s.add_development_dependency 'pry','0.10.0'
  s.add_development_dependency 'rubygems-tasks', '0.2.4'
  s.add_development_dependency 'simplecov', '0.9.1'
  s.add_development_dependency'webmock', '~>1.18.0'
  s.add_development_dependency'rest-client', '~> 1.7.2'
  s.add_development_dependency 'activesupport', '~> 4.1.6'
end
