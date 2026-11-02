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

  def generate
    [prefix, ULID.generate].compact.join
  end

  def generates_default?
    initial && !nullable
  end

  def cast(value)
    return value unless value.nil?
    return unless generates_default?

    generate
  end
end
