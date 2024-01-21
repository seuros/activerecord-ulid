# frozen_string_literal: true

require_relative "ulid/version"
require "active_record"
require "ulid"

require_relative "ulid/ulid_attribute"
ActiveRecord::Type.register(:ulid, ULIDAttribute)
