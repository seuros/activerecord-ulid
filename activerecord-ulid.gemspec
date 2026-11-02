# frozen_string_literal: true

require_relative "lib/activerecord/ulid/version"

Gem::Specification.new do |spec|
  spec.name = "activerecord-ulid"
  spec.version = ActiveRecordULID::VERSION
  spec.authors = ["Abdelkader Boudih"]
  spec.email = ["terminale@gmail.com"]

  spec.summary = "Add ULID support to ActiveRecord"
  spec.description = "A :ulid attribute type for Active Record: every record gets its own ULID, " \
                     "optionally prefixed, generated when the record is built."
  spec.homepage = "https://github.com/seuros/activerecord-ulid"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 4.0"

  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/master/CHANGELOG.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = Dir["lib/**/*.rb", "LICENSE.txt", "README.md", "CHANGELOG.md"]
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", ">= 8.1"
  spec.add_dependency "ulid", "~> 1.4"
end
