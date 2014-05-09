require 'rake/testtask'

task :default => [:test]
task :test do |t|
  t.libs << "test"
  t.test_files = FileList['test/test*.rb']
  t.verbose = true
end