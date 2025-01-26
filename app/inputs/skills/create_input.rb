# frozen_string_literal: true

class Skills::CreateInput < ApplicationContract
  params do
    required(:skill).hash do
      required(:name).filled(:string)
    end
  end
end
