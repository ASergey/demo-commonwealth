# frozen_string_literal: true

# Definition of application-specific types that can be used in the input contracts.
module Types
  include Dry::Types()

  StrippedString = Types::String.constructor(&:strip)
  IntegerID = Types::Coercible::Integer.constrained(gt: 0)
end
