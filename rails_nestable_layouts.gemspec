lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

gem_name = 'rails_nestable_layouts'

require "#{gem_name}/version.rb"

Gem::Specification.new do |s|
  s.name        = gem_name
  s.version     =  RailsNestableLayouts::VERSION
  s.author	= "Weston Ganger"
  s.email       = 'weston@westonganger.com'
  s.homepage 	= "https://github.com/westonganger/#{gem_name}"
  
  s.summary     = "Dead simple nested layouts for Rails"
  s.description = "Dead simple nested layouts for Rails"
  s.files = Dir.glob("{lib/**/*}") + %w{ LICENSE README.md Rakefile CHANGELOG.md }
  s.test_files  = Dir.glob("{test/**/*}")

  s.add_dependency 'actionview', '>= 3'
  s.add_dependency 'actionpack', '>= 3'
  s.add_dependency 'activesupport', '>= 3'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'bundler'

  s.required_ruby_version = '>= 1.9.3'
  s.require_path = 'lib'
end
