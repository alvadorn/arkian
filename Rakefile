
require 'rake'
require 'rake/testtask'
desc 'Run specs'
Rake::TestTask.new do |t|
  t.libs << 'src'
  t.verbose = true
	t.test_files = Dir.glob('spec/**/*_spec.rb')
end

task :default => :test
