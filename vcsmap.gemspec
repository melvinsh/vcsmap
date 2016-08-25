Gem::Specification.new do |s|
  s.name        = 'vcsmap'
  s.version     = '1.0.0'
  s.date        = '2016-08-25'
  s.summary     = 'Scan public version control systems for sensitive information.'
  s.description = 'A plugin-based tool to scan public version control systems for sensitive information. '
  s.authors     = ['Melvin Lammerts']
  s.email       = 'hi@melvin.sh'
  s.files       = Dir['lib/**/*.rb']
  s.executables << 'vcsmap'
  s.homepage    =
    'https://github.com/melvinsh/vcsmap'
  s.license       = 'MIT'
  s.add_runtime_dependency 'nokogiri', '~> 1.6', '>= 1.6.8'
  s.add_runtime_dependency 'http', '~> 2.0', '>= 2.0.3'
  s.add_runtime_dependency 'tty', '~> 0.5.0'
  s.add_runtime_dependency 'require_all', '~> 1.3', '>= 1.3.3'
end

