# frozen_string_literal: true

require "bundler/gem_tasks"
require "bundler/setup"

APP_RAKEFILE = File.expand_path("test/dummy/Rakefile", __dir__)
load "rails/tasks/engine.rake"

load "rails/tasks/statistics.rake"

require "rake/testtask"

require "rubocop/rake_task"

RuboCop::RakeTask.new

task default: %i[test rubocop]
