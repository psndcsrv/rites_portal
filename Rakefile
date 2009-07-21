require(File.join(File.dirname(__FILE__), 'config', 'boot'))
require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'tasks/rails'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the portal plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the portal plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Portal'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
