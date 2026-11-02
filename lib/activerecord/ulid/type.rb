# frozen_string_literal: true

module ActiveRecordULID
  # The :ulid attribute type: a string column holding a ULID, optionally prefixed.
  # A nil value becomes a fresh ULID unless the attribute is nullable or opted out
  # with initial: false.
  class Type < ActiveRecord::Type::String
    attr_reader :prefix, :nullable, :initial

    def initialize(prefix: nil, nullable: false, initial: true, **)
      @prefix = prefix
      @nullable = nullable
      @initial = initial
      super(**)
    end

    def generate
      "#{prefix}#{ULID.generate}"
    end

    def generates_default?
      initial && !nullable
    end

    def cast(value)
      return value unless value.nil?

      generate if generates_default?
    end
  end
end
