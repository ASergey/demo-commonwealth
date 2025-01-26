# frozen_string_literal: true

class Courses::UpdateInput < ApplicationContract
  params do
    required(:course).hash do
      optional(:title).filled(Types::StrippedString)
      optional(:skill_ids).value(Types::Array.of(Types::IntegerID))
      optional(:author_id).filled(Types::IntegerID)
      optional(:description).filled(Types::StrippedString)
    end
  end
end
