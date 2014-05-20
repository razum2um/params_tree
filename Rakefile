require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |test|
  test.libs << "lib" << "test"
  test.pattern = "test/*_test.rb"
end

desc "generates parser"
task :generate do
  system("ragel -R #{File.expand_path('../lib/params_tree/parser.rl', __FILE__)} > #{File.expand_path('../lib/params_tree/parser.rb', __FILE__)}")
end

desc 'releases gem & updates docs'
task :publish do
  require 'params_tree'
  version = ParamsTree::VERSION

  Bundler.with_clean_env do
    system "git tag v#{version}"
    system "gem build params_tree.gemspec"
    system "git push --tags"
    system "gem push params_tree-#{version}.gem"
  end
end

task :default => :test

