require File.expand_path(File.dirname(__FILE__) + '/lib/rails_nested_layouts/version.rb')
require 'bundler/gem_tasks'

task :test do 
  require 'rake/testtask'
  Rake::TestTask.new do |t|
    t.libs << 'test'
    t.test_files = FileList['test/**/*test.rb']
    t.verbose = true
  end
end

task default: :test

task :console do
  require 'rails_nested_layouts'

  require 'irb'
  binding.irb
end
