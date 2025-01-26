# frozen_string_literal: true

class Courses::CreateInput < ApplicationContract
  params do
    required(:course).hash do
      required(:title).filled(Types::StrippedString)
      required(:skill_ids).value(Types::Array.of(Types::IntegerID))
      required(:author_id).value(Types::IntegerID)
      optional(:description).filled(Types::StrippedString)
    end
  end
end
