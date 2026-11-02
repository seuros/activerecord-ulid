# frozen_string_literal: true

require "bundler/gem_tasks"
require "shellwords"

# padded_cell runs the suite: test classes in parallel workers, each with its
# own database. Runner options go in ARGS:
#   rake test ARGS="-j 4 test/activerecord/ulid_test.rb:12"
desc "Run the test suite with padded_cell (arguments in ARGS)"
task :test do
  sh "bundle", "exec", "padded_cell", *Shellwords.split(ENV.fetch("ARGS", ""))
end

task default: :test
