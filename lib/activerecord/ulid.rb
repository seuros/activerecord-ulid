# frozen_string_literal: true

require "active_record"
require "ulid"

require_relative "ulid/version"
require_relative "ulid/type"
require_relative "ulid/attribute_default"

ActiveRecord::Type.register(:ulid, ActiveRecordULID::Type)
ActiveSupport.on_load(:active_record) { singleton_class.prepend(ActiveRecordULID::AttributeDefault) }
