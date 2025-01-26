# frozen_string_literal: true

class Authors::CreateInput < ApplicationContract
  params do
    required(:author).hash do
      required(:firstname).filled(:string)
      required(:lastname).filled(:string)
    end
  end
end
