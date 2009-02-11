$:.unshift(RAILS_ROOT + '/vendor/plugins/cucumber/lib')
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "--language ja --format "
  t.cucumber_opts << (ENV["FEATURE"] ? "pretty" : "progress")
end
task :features => 'db:test:prepare'
