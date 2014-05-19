require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |test|
  test.libs << "lib" << "test"
  test.pattern = "test/*_test.rb"
  test.warning = true
  test.verbose = true
end

desc "generates parser"
task :generate do
  system("ragel -R #{File.expand_path('../lib/params_tree/parser.rl', __FILE__)} > #{File.expand_path('../lib/params_tree/parser.rb', __FILE__)}")
end

task :default => [:generate, :test]

