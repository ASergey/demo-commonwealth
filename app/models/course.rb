# frozen_string_literal: true

# rubocop:disable Rails/HasAndBelongsToMany
class Course < ApplicationRecord
  has_and_belongs_to_many :skills
  belongs_to :author
end
# rubocop:enable Rails/HasAndBelongsToMany
