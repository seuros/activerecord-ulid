# frozen_string_literal: true

source "https://rubygems.org"

gemspec

rails_version = ENV.fetch("RAILS_VERSION", "~> 8.1.0")
if rails_version == "edge"
  git "https://github.com/rails/rails.git", branch: "main" do
    gem "activerecord"
    gem "railties"
  end
else
  gem "activerecord", rails_version
  gem "railties", rails_version
end

gem "rake"
gem "sqlite3", ">= 2.1"

group :test do
  gem "minitest", "~> 6.0"
  gem "padded_cell", "~> 0.2"
end
