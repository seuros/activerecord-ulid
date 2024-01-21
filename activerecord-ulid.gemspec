# frozen_string_literal: true

require_relative "lib/activerecord/ulid/version"

Gem::Specification.new do |spec|
  spec.name = "activerecord-ulid"
  spec.version = ActiveRecordULID::VERSION
  spec.authors = ["Abdelkader Boudih"]
  spec.email = ["terminale@gmail.com"]

  spec.summary = "Add ULID support to ActiveRecord"
  spec.description = spec.description
  spec.homepage = "https://github.com/seuros/activerecord-ulid"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/seuros/activerecord-ulid"
  spec.metadata["changelog_uri"] = "https://github.com/seuros/activerecord-ulid/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.glob("lib/**/*", File::FNM_DOTMATCH)
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord"
  spec.add_dependency "ulid"
end
