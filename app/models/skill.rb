# frozen_string_literal: true

# rubocop:disable Rails/HasAndBelongsToMany
class Skill < ApplicationRecord
  has_and_belongs_to_many :courses
end
# rubocop:enable Rails/HasAndBelongsToMany
