require 'bundler'
Bundler::GemHelper.install_tasks

require 'rake/testtask'

desc 'Test the admin_view plugin.'
Rake::TestTask.new(:test) do |test|
  test.libs << 'test'
  test.test_files = FileList['test/*_test.rb']
  test.verbose = true
end
