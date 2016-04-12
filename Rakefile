require 'rspec/core/rake_task'

task :default => :test
RSpec::Core::RakeTask.new(:spec)

desc "Test the stub test orchestrator"
task :test => :spec do
  ENV["TEST_ORCHESTRATION_PROVIDER"] ||= "stub"
  sh %{bundle exec cucumber}
  sh %Q{
    cd production/jewels/create_profile &&
    env -i PATH=/bin:/usr/bin HOME=#{ENV["HOME"]} #{ENV["HOME"]}/.rvm/bin/rvm-exec $(cat .ruby-version)@$(cat .ruby-gemset) bundle install &&
    env -i PATH=/bin:/usr/bin HOME=#{ENV["HOME"]} #{ENV["HOME"]}/.rvm/bin/rvm-exec $(cat .ruby-version)@$(cat .ruby-gemset) bundle exec rspec -cfd spec
  }
end

task :ci => :spec do
  ENV["TEST_ORCHESTRATION_PROVIDER"] ||= "stub"
  sh %{bundle exec cucumber}
  sh %Q{
    cd production/jewels/create_profile &&
    env -i PATH=/bin:/usr/bin:#{ENV["HOME"]}/.rvm/rubies/ruby-2.3.0/bin: HOME=#{ENV["HOME"]} sudo apt-get install rubygems && 
    env -i PATH=/bin:/usr/bin:#{ENV["HOME"]}/.rvm/rubies/ruby-2.3.0/bin: HOME=#{ENV["HOME"]} gem install bundler &&
    env -i PATH=/bin:/usr/bin:#{ENV["HOME"]}/.rvm/rubies/ruby-2.3.0/bin: HOME=#{ENV["HOME"]} bundle install &&
    env -i PATH=/bin:/usr/bin:#{ENV["HOME"]}/.rvm/rubies/ruby-2.3.0/bin: HOME=#{ENV["HOME"]} bundle exec rspec -cfd spec
  }
end
