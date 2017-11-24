
require 'bundler/gem_tasks'
require 'rake/testtask'


desc 'Run specs'
Rake::TestTask.new(:test) do |t|
  t.libs << 'spec'
  t.libs << 'lib'
  t.verbose = true
	t.test_files = Dir.glob('spec/**/*_spec.rb')
end

task :default => :test
