# Rakefile

require 'sinatra/activerecord/rake'
require 'rake/testtask'

namespace :db do
	task :load_config do
		require './app'
	end
end

Rake::TestTask.new do |t|
	t.libs = ["lib"]
	t.warning = true
	t.verbose = true
	t.pattern = "test/test_*.rb"
end

