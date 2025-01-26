# frozen_string_literal: true

class Authors::UpdateAction
  def call(author, input)
    author.update!(input)
  end
end
