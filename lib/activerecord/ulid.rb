# frozen_string_literal: true

require_relative "ulid/version"
require "active_record"
require "ulid"

require_relative "ulid/ulid_attribute"
require_relative "ulid/attribute_default"
ActiveRecord::Type.register(:ulid, ULIDAttribute)
ActiveSupport.on_load(:active_record) { singleton_class.prepend(ActiveRecordULID::AttributeDefault) }
