# frozen_string_literal: true

class Authors::CreateAction
  def call(input)
    Author.create!(input)
  end
end
