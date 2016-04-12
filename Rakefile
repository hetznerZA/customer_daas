require "bundler/gem_tasks"
require 'rspec/core/rake_task'

task :default => :test

RSpec::Core::RakeTask.new(:spec)

desc "Test the stub test orchestrator"
task :test => :spec do
  ENV["TEST_ORCHESTRATION_PROVIDER"] ||= "stub"
  sh %{bundle exec cucumber}
  sh %Q{
    cd production/jewels/create_profile &&
    bundle install &&
    bundle exec rspec spec/
  }
end
