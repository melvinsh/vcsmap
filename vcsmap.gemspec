require_relative 'lib/vcsmap'

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name        = 'vcsmap'
  s.version     = Vcsmap::VERSION
  s.licenses    = ['MIT']
  s.summary     = 'Scans public repositories for sensitive information.'
  s.description = 'A plugin-based tool to scan public version control systems for sensitive information.'
  s.authors     = ['Melvin Lammerts']
  s.email       = 'hi@melvin.sh'
  s.files       = Dir['lib/**/*.rb']
  s.require_paths = ['lib']
  s.executables = 'vcsmap'
  s.homepage    = 'http://vcsmap.org'
end
