# frozen_string_literal: true

module ActiveRecordULID
  module AttributeDefault
    def attribute(name, type = nil, **options, &block)
      unless options.key?(:default)
        ulid = type.is_a?(ULIDAttribute) ? type : (ULIDAttribute.new(**options) if type == :ulid)
        options[:default] = -> { ulid.generate } if ulid&.generates_default?
      end

      super
    end
  end
end
