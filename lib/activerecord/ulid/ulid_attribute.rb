# frozen_string_literal: true

class ULIDAttribute < ActiveRecord::Type::String
  attr_reader :prefix,
              :nullable,
              :initial

  def initialize(precision: nil, limit: nil, scale: nil, prefix: nil, nullable: false, initial: true)
    @prefix = prefix
    @initial = initial
    @nullable = nullable
    super()
  end

  def cast(value)
    return value if value.present?
    return if value.nil? && nullable

    value = ULID.generate if value.nil? && initial
    return value if value.empty?

    [prefix, value].compact.join
  end
end
