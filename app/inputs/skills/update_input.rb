# frozen_string_literal: true

class Skills::UpdateInput < ApplicationContract
  params do
    required(:skill).hash do
      required(:name).filled(:string)
    end
  end
end
